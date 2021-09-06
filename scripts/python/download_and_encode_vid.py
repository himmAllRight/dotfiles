import os
import re

def load_video_list(vid_list_file_src):
    """Loads the video urls form the video list"""
    with open(vid_list_file_src, "r") as f:
        vid_urls = [ line.rstrip() for line in f]
    return vid_urls

def run_command(cmd):
    """Executes a shell command"""
    cmd_result = os.popen(cmd)
    return cmd_result

class Vid():
    """A video object."""
    def __init__(self, id, vid_url):
        self.id = id
        self.vid_url= vid_url

    def process_video(self):
        """Runs through the steps to process a video."""
        pass

    def download_vid(self):
        """Downloads the video"""
        dl_cmd = f"youtube-dl -o \"id-{self.id}--%(title)s.%(ext)s\" {self.vid_url}"
        print(dl_cmd)

    def encode_video(self, regex_str="id-(\d+)--(.+)\.(.*)"):
        """Downloads the video"""
        r = re.compile(regex_str)
        # TODO: Check expected video file exists

        pass

    def remove_temp_vid_file(self):
        """Removes the originally downloaded vid file."""
        pass