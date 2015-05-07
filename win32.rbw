#coding: utf-8
require 'sdl'

SDL.init(SDL::INIT_VIDEO)
begin
  w,h=1920,1080
  screen=SDL::Screen.open(w,h,32,SDL::SWSURFACE|SDL::FULLSCREEN)
rescue
  w,h=1024,768
  screen=SDL::Screen.open(w,h,32,SDL::SWSURFACE|SDL::FULLSCREEN)
end

SDL::TTF.init
font=SDL::TTF.open("C:/WINDOWS/Fonts/MINGLIU.ttc",20,0)
font.style=SDL::TTF::STYLE_ITALIC

SDL::Mouse.hide

str=<<-EOF

A problem has been detected and Windows has been shut down to prevent damage
to your computer.

TODAY_IS_APRIL_FOOL'S_DAY

If this is the first time you've seen this error screen,
restart your computer. If this screen appears again, follow
these steps:

Check to make sure any new hardware or software is properly installed.
If this is a new installation, ask your hardware or software manufacturer
for any Windows updates you might need.

If problems continue, disable or remove any newly installed hardware
or software. Disable BIOS memory options such as caching or shadowing.
If you need to use Safe Mode to remove or disable components, restart
your computer, press F8 to select Advanced Startup Options, and then
select Safe Mode.


Technical information:

*** STOP: 0x000000XD (0x00000486, 0x00000386, 0x00000286, 0x000000XD)


Beginning dump of physical memory
Physical memory dump complete.
Contact your system administrator or technical support group for further
assistance.
EOF

color={}
color[:BACK]=[0,0,155]
color[:FONT]=
screen.fill_rect(0,0,w,h,color[:BACK])

str.split(/\n/).each_with_index{|s,i|
  if s.size>0
    font.draw_solid_utf8(screen,s,5,20*i,*[235,235,235])
  end
}

screen.flip
while true
  event=SDL::Event.poll
  case event
  when SDL::Event::KeyDown
    case event.sym
    when SDL::Key::ESCAPE
      exit
    end
  when SDL::Event::Quit
    exit
  end
end