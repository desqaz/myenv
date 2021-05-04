#!/usr/bin/env python

def log(msg):
    from sys import stderr
    print(msg, file=stderr)

def quoteFile(filename):
    return '"%s"' % filename if ' ' in filename else filename

def doFilesList(WorkDir, TagsIgnoreFile, TagsAddFile, OutFilesList, ExtensionList):
    from os import walk as osw
    from os import path as osp

    def parseListFile(listFile):
        l = []
        if osp.isfile(listFile):
            with open(listFile) as f:
                for line in f:
                    if not line.startswith('#'):
                        l.append(line.strip())
        return l

    ignoreList = parseListFile(TagsIgnoreFile)
    addList = parseListFile(TagsAddFile)

    if len(ignoreList) > 0:
        log("  + Ignoring %u elements" % len(ignoreList))
        for e in ignoreList:
            log("    - %s" % e)
            
    if len(addList) > 0:
        log("  + Adding %u elements" % len(addList))
        for e in addList:
            log("    - %s" % e)

    ignoreList = [ osp.join(WorkDir, e) for e in ignoreList ]
    addList    = [ osp.join(WorkDir, e) for e in addList    ]
    
    filesCount = 0
    with open(OutFilesList, "w") as out:
        for root, dirs, files in osw(WorkDir):
            for f in files:
                r , ext = osp.splitext(f)
                if ext[1:] not in ExtensionList:
                    continue
                        
                e = osp.join(root, f)
                addToFile = True
                for ignore in ignoreList:
                    if e.startswith(ignore):
                        addToFile = False
                        break

                if addToFile:
                    filesCount += 1
                    out.write("%s\n" % e)
        
        for d in addList:
            for root, dirs, files in osw(d):
                for f in files:
                    r , ext = osp.splitext(f)
                    if ext[1:] not in ExtensionList:
                        continue

                    filesCount += 1
                    out.write("%s\n" % osp.join(root, f))

    log("  + List contains %u files" % filesCount)

def doCscopeDb(OutFilesList, OutCscopeDb):
    import subprocess
    cmd = "cscope -Rkbc -i - -f %s" % (OutCscopeDb)
    p = subprocess.Popen(cmd, shell=True, stdin=subprocess.PIPE)
    with open(OutFilesList) as fileslist:
        for file in fileslist:
            p.stdin.write(('%s\n' % quoteFile(file.strip())).encode())
    p.stdin.close()

def doCtagsTags(OutFilesList, OutCtagsTags):
    import subprocess
    cmd = "ctags --fields=+lStn --extra=+f --tag-relative=yes -L %s -f %s" % (OutFilesList, OutCtagsTags)
    subprocess.check_call(cmd, shell=True)

def doVimHighLight(OutCtagsTags, OutVimTagsHl):
    import re
    reg = re.compile(r'^(\w+)\t[^\"]*\"\t(t|f|d|e).*$')
    synList = []
    with open(OutCtagsTags, encoding='latin-1') as ctags:
        for line in ctags:
            m = reg.match(line)
            if m:
                synList.append((m.group(2), m.group(1)))

    synList = sorted(set(synList))

    with open(OutVimTagsHl, "w") as vimHl:
        for syn in synList:
            vimHl.write("syntax keyword c_%s %s\n" % syn)

def doWriteExportVar(WorkDir, VimTagsPath, OutCscopeDb, OutCtagsTags, OutVimTagsHl, OutExportVar):
    with open(OutExportVar, "w") as f:
        f.write('export VIMTAGSPATH="%s"\n'       % VimTagsPath )
        f.write('export CSCOPE_DB="%s"\n'         % OutCscopeDb )
        f.write('export tagsfile="%s"\n'          % OutCtagsTags)
        f.write('export TAGS_HL="%s"\n'           % OutVimTagsHl)
        f.write('export VIMPROJSERVERNAME="%s"\n' % WorkDir     )
 
if __name__ == "__main__":
    from os import path as osp
    from os import environ as ose
    from os import makedirs as osmkdir
    
    WorkDir = osp.abspath(osp.curdir)
    VimTagsPathRoot = osp.join(ose['HOME'], '.vimtagsroot')
    WorkDirFlat = "".join([ c if c.isalnum() else "_" for c in WorkDir ])
    VimTagsPath = osp.join(VimTagsPathRoot, WorkDirFlat)
    if not osp.isdir(VimTagsPath):
        osmkdir(VimTagsPath)
    
    OutFilesList = osp.join(VimTagsPath, 'files.list')
    OutCscopeDb  = osp.join(VimTagsPath, 'cscope.out')
    OutCtagsTags = osp.join(VimTagsPath, 'tags')
    OutVimTagsHl = osp.join(VimTagsPath, 'tags_hl.vim')
    OutExportVar = osp.join(VimTagsPath, 'export_var_for_vim')
    
    TagsIgnoreFile = osp.join(WorkDir, '.7tags.ignore')
    TagsAddFile    = osp.join(WorkDir, '.7tags.add')

    ExtensionList = [ 'h', 'c', 'cc', 'cpp', 'hpp' ]

    log("Tags artifact will be stored in %s" % VimTagsPath)

    log(" + Generate files list")
    doFilesList(WorkDir, TagsIgnoreFile, TagsAddFile, OutFilesList, ExtensionList)

    log(" + Generate CSCOPE database")
    doCscopeDb(OutFilesList, OutCscopeDb)

    log(" + Generate CTAGS database")
    doCtagsTags(OutFilesList, OutCtagsTags)

    log(" + Generate VIM syntax highlights")
    doVimHighLight(OutCtagsTags, OutVimTagsHl)

    log(" + Write export variables")
    doWriteExportVar(WorkDir, VimTagsPath, OutCscopeDb, OutCtagsTags, OutVimTagsHl, OutExportVar)

    print(OutExportVar)

    log("Done !")


    
    

