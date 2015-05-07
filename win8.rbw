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

SDL::Mouse.hide

SDL::TTF.init
path="C:/WINDOWS/Fonts/Consola.ttf"

font={}
font[:BIG]=SDL::TTF.open(path,120)
font[:MID]=SDL::TTF.open(path,28)
font[:MIN]=SDL::TTF.open(path,20)

str={}
str[:BIG]=":("
str[:MID]=<<-EOF
Your PC ran into a problem that it couldn't
handle, and now it needs to restart.
EOF
str[:MIN]="You can search for the error online:TODAY_IS_APRIL_FOOL'S_DAY"

color={}
color[:FONT]=[235,235,235]
color[:BACK]=[0,100,255]

screen.fill_rect(0,0,w,h,color[:BACK])

font[:BIG].draw_solid_utf8(screen,str[:BIG],80,200,*color[:FONT])
str[:MID].split(/\n/).each_with_index{|s,i|
  s.size>0 and
  font[:MID].draw_solid_utf8(screen,s,100,350+48*i,*color[:FONT])
}
font[:MIN].draw_solid_utf8(screen,str[:MIN],100,500,*color[:FONT])

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