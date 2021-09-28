import os
import re
import sys

DOWNLOAD_DIR = "/var/home/ryan/DL_Videos/"

def main_loop(video_list_file):
    """Loads videos from list into objects, and then processes them."""
    id = 1
    video_list=[]
    for video_url in load_video_list(video_list_file):
        video_list.append(Vid(id, video_url))
        id+=1
    for video in video_list:
        print(f"Starting to process {video.vid_url}")
        video.process_video()

def load_video_list(vid_list_file_src):
    """Loads the video urls form the video list"""
    with open(vid_list_file_src, "r") as f:
        vid_urls = [ line.rstrip() for line in f]
    return vid_urls

def run_command(cmd):
    """Executes a shell command"""
    cmd_result = os.system(cmd)
    return cmd_result

def get_download_vid_matches(dl_dir=DOWNLOAD_DIR, regex_str="id-(\d+)--(.+)\.(.*)"):
    """Searched the download folder for ID files, and returns an id-index dictionary of the matches."""
    r = re.compile(regex_str)
    file_list = os.listdir()
    match_list = [r.findall(f)[0] for f in file_list if r.findall(f)]
    match_dict = {}
    for match_file in match_list:
        match_dict[int(match_file[0])] = match_file
    return match_dict

class Vid():
    """A video object."""
    def __init__(self, id, vid_url):
        self.id = id
        self.vid_url= vid_url

    def process_video(self):
        """Runs through the steps to process a video."""
        self.download_vid()
        self.encode_video()
        self.remove_temp_vid_file()
        pass

    def download_vid(self):
        """Downloads the video"""
        os.chdir(DOWNLOAD_DIR)
        dl_cmd = f"youtube-dl -o \"id-{self.id}--%(title)s.%(ext)s\" {self.vid_url}"
        print(dl_cmd)
        run_command(dl_cmd)

    def encode_video(self, regex_str="id-(\d+)--(.+)\.(.*)", video_codec="h264"):
        """Downloads the video"""
        os.chdir(DOWNLOAD_DIR)
        download_dict = get_download_vid_matches()
        if self.id in download_dict.keys():
            print("Encoding File")
            file_info = download_dict[self.id]
            encode_cmd = f"ffmpeg -i 'id-{file_info[0]}--{file_info[1]}.{file_info[2]}' -c:v {video_codec} -c:a copy '{file_info[1]}.{file_info[2]}'"
            print(encode_cmd)
            run_command(encode_cmd)
        else:
            # TODO turn to log
            print("expected downloaded file not in match dictionary")

    def remove_temp_vid_file(self):
        """Removes the originally downloaded vid file."""
        os.chdir(DOWNLOAD_DIR)
        download_dict = get_download_vid_matches()
        if self.id in download_dict.keys():
            print("Removing Temp Downloaded File")
            file_info = download_dict[self.id]
            rm_cmd = f"rm 'id-{file_info[0]}--{file_info[1]}.{file_info[2]}'"
            run_command(rm_cmd)
        else:
            # TODO turn to log
            print("expected downloaded file not in match dictionary")


### Execution code (For now)
#print(sys.argv[1])
#main_loop(sys.argv[1])