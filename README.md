http://3.36.176.102:8080/movie_design/index.do   <-- Link to the site  
주제:영화 리뷰 사이트   
상세내용:   

코로나19로 인하여 현재 대다수의 사람들이 극장에서 영화를 관람하는 것보다 편안하고 안전하게 집에서 다양한 영화플랫폼들을 통하여 영화들을 시청하는것을 더 선호하고 있습니다. 영화를 시청하기 전에 솔직한 회원들의 리뷰들을 통하여 사용자들이 자신의 취향에 맞게 영화를 선택해서 보았으면 하고자 프로젝트를 진행해보았습니다.   
*Spring FrameWork 기반으로 프로젝트를 진행하였고 모든 작업절차는 아래와  같이 제작하였습니다.

 -------------- 작업 절차   
-------------- 1) SQL   
-------------- 2) VO(DTO) 제작   
-------------- 3) MyBATIS  ◁──+   
-------------- 4) DAO ─────┘ ◁─+   
-------------- 5) Process ───────┘  ◁─+   
-------------- 6) Controller  ─────────↑GET. POST↓결과 출력   
-------------- 7) JSP    
                
                
프로젝트에 사용한 기술:  
1.CRUD   
2.File upload   
3.Search   
4.PAGING   
5.jQuery Ajax+JSON   
6.Python BeatifulSoup 사용하여 WebCrawling

*ERD:   
![image](https://user-images.githubusercontent.com/55689576/123955383-801bab80-d9e4-11eb-967f-6a21f303bf3c.png)


*Session   
Session을 사용하여 유저가 보는 페이지와 관리자가 보는 페이지를 따로 구반하여 제작하였습니다 또한 오로지 관리자만 수정 삭제 제작을 할 수 있도록 권한도 설정하였습니다. 

*계획   
좋아요 기능을 추가하여 각 회원들에게 영화 추천 기능을 넣을 예정입니다. 


-------------
github address: [junghyonk][github]   

[github]:http://github.com/junghyonk
