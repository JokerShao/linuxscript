""" clean invalid character in text file """
import os
import re
import json
import chardet

CHAR_DICT = {
    "Demo": '\x00',
    "Nutstore": '\x01'
}


def detect_encoding(filepath):
    """ detect text file encoding and return it """
    fbin = open(filepath, 'rb')
    return chardet.detect(fbin.read())['encoding']


def file_finder(path, filetype):
    """ find target type file in directory """
    generator = os.walk(path)
    filelist = list()
    for subpath, _, flist in generator:
        for filename in flist:
            global_file_path = os.path.join(subpath, filename)
            if re.match('.+\.'+filetype, global_file_path):
                filelist.append(global_file_path)
    return filelist


def get_invalidchar_codec(filepath):
    """ get invalid character from text file """
    with open(filepath, 'r', encoding=detect_encoding(filepath)) as cfile:
        return cfile.read()


def get_invalid_character(chartype):
    """ doc string """
    global CHAR_DICT
    return json.loads(json.dumps(CHAR_DICT))[chartype]


def clean_content(filelist, invalid_char):
    """ doc string """
    modified_list = list()
    for instance in filelist:
        fenc = detect_encoding(instance)
        if not fenc == 'utf-8':
            print(instance, 'encoding is', fenc+', will save it as utf-8.')
        fdescriptor = open(instance, 'r', encoding=fenc)
        contents = fdescriptor.read()
        fdescriptor.close()
        newcontents = re.sub(invalid_char, '', contents)
        fdescriptor = open(instance, 'w', encoding='utf-8')
        fdescriptor.write(newcontents)
        fdescriptor.close()

        if contents != newcontents or fenc != 'utf-8':
            modified_list.append(instance)
    return len(modified_list), modified_list


def iprint(filetype, filecnt, filelist):
    """ doc string """
    print('modify', filetype, 'file count:', filecnt)
    if filecnt:
        print('modify', filetype, 'list is:')
    for filename in filelist:
        print(filename)
    print('>>>>>>>>>>')


if __name__ == "__main__":
    # configuration
    PATH = '/home/joker/data/Nutstore'
    TARGET_CHAR = 'Nutstore'
    TARGET_TYPE = ['md', 'txt']
    INVALID_CHAR = get_invalid_character(TARGET_CHAR)

    # start process
    for ftype in TARGET_TYPE:
        MARKDOWN_FILE_LIST = file_finder(PATH, ftype)
        FILECNT, MODIFY_LIST = clean_content(MARKDOWN_FILE_LIST, INVALID_CHAR)
        iprint(ftype, FILECNT, MODIFY_LIST)
    print('clean finish!')
