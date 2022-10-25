package com.itwill.brown_carrot_market.util;
public class PageMaker {
 
    // 페이지당 게시물 수
    private int pageScale = 10;
    // 화면당 페이지 수
    private int blockScale = 10;
     
    public int getPAGE_SCALE() {
		return pageScale;
	}

	public void setPAGE_SCALE(int pAGE_SCALE) {
		pageScale = pAGE_SCALE;
	}

	public int getBLOCK_SCALE() {
		return blockScale;
	}

	public void setBLOCK_SCALE(int bLOCK_SCALE) {
		blockScale = bLOCK_SCALE;
	}
	private int curPage;    // 현재 페이지
    
    private int prevPage;   // 이전 페이지
    private int nextPage;   // 다음 페이지
    
    private int prevGroupStartPage;   // 이전 그룹시작페이지
    private int nextGroupStartPage;   // 다음 그룹시작페이지
    
    
    private int totPage;    // 전체 페이지 갯수
    private int totBlock;   // 전체 페이지 블록 갯수
    private int curBlock;   // 현재 페이지 블록 
    private int prevBlock;  // 이전 페이지 블록
    private int nextBlock;  // 다음 페이지 블록
     
    // WHERE rn BETWEEN #{start} AND #{end}
    private int pageBegin;  // #{start}
    private int pageEnd;    // #{end}
    // [이전] blockBegin -> 41 42 43 44 45 46 47 48 49 50 [다음]
    private int blockBegin; // 현재 페이지 블록의 시작번호
    // [이전] 41 42 43 44 45 46 47 48 49 50 <- blockEnd [다음]
    private int blockEnd;   // 현재 페이지 블록의 끝번호
     
    // 생성자
    // PageMaker(게시물 갯수, 현재 페이지 번호)
    public PageMaker(int count, int curPage){
        curBlock = 1;                   // 현재 페이지 블록 번호
        this.curPage = curPage;         // 현재 페이지 설정
        setTotPage(count);              // 전체 페이지 갯수 계산
        setPageRange(); 
        setTotBlock(count);             // 전체 페이지 블록 갯수 계산
        setBlockRange();                // 페이지 블록의 시작, 끝 번호 계산
    }
     
    public PageMaker(int count, int curPage, int pageScale, int blockScale){
    	curBlock = 1;                   // 현재 페이지 블록 번호
    	this.curPage = curPage;         // 현재 페이지 설정
    	this.pageScale = pageScale;
    	this.blockScale = blockScale;
    	setTotPage(count);              // 전체 페이지 갯수 계산
    	setPageRange(); 
    	setTotBlock(count);             // 전체 페이지 블록 갯수 계산
    	setBlockRange();                // 페이지 블록의 시작, 끝 번호 계산
    }
    public void setBlockRange(){
        // *현재 페이지가 몇번째 페이지 블록에 속하는지 계산
        curBlock = (int)Math.ceil((curPage-1) / blockScale)+1;
        // *현재 페이지 블록의 시작, 끝 번호 계산
        blockBegin = (curBlock-1)*blockScale+1;
        // 페이지 블록의 끝번호
        blockEnd = blockBegin+blockScale-1;
        // *마지막 블록이 범위를 초과하지 않도록 계산
        if(blockEnd > totPage) blockEnd = totPage;
        // *이전을 눌렀을 때 이동할 페이지 번호
        prevPage = curPage-1;
        // *다음을 눌렀을 때 이동할 페이지 번호
        nextPage = curPage+1;
        // 마지막 페이지가 범위를 초과하지 않도록 처리
        if(nextPage >= totPage) nextPage = totPage;
        /***********************************************/
        // 이전다음 화면그룹의 시작페이지와 끝페이지
        prevGroupStartPage = blockBegin - blockScale;		
     	//if(prevGroupStartPage < 0){// groupNo이 0인 경우(페이지 인덱스가 0~10사이)
     	//	prevGroupStartPage = 0;
     	//}
     	nextGroupStartPage = blockBegin + blockScale;
        //if(nextGroupStartPage > totPage)nextGroupStartPage=totPage;
     	/***********************************************/
        
        
    }
     
    public int getPrevGroupStartPage() {
		return prevGroupStartPage;
	}

	public void setPrevGroupStartPage(int prevGroupStartPage) {
		this.prevGroupStartPage = prevGroupStartPage;
	}

	public int getNextGroupStartPage() {
		return nextGroupStartPage;
	}

	public void setNextGroupStartPage(int nextGroupStartPage) {
		this.nextGroupStartPage = nextGroupStartPage;
	}

	public void setPageRange(){
    // WHERE rn BETWEEN #{start} AND #{end}
        // 시작번호 = (현재페이지-1)*페이지당 게시물수 +1
        pageBegin = (curPage-1)*pageScale+1;
        // 끝번호 = 시작번호+페이지당 게시물수 -1
        pageEnd = pageBegin+pageScale-1;
    }
     
    // Getter/Setter
    public int getCurPage() {
        return curPage;
    }
    public void setCurPage(int curPage) {
        this.curPage = curPage;
    }
    public int getPrevPage() {
        return prevPage;
    }
    public void setPrevPage(int prevPage) {
        this.prevPage = prevPage;
    }
    public int getNextPage() {
        return nextPage;
    }
    public void setNextPage(int nextPage) {
        this.nextPage = nextPage;
    }
    public int getTotPage() {
        return totPage;
    }
    public void setTotPage(int count) {
        // Math.ceil(실수) 올림 처리
        totPage = (int) Math.ceil(count*1.0 / pageScale);
    }
    public int getTotBlock() {
        return totBlock;
    }
    // 페이지 블록(그룹)의 갯수 계산(총 100페이지라면 10개의 블록)
    public void setTotBlock(int count) {
        // 전체 페이지 갯수 / 10
        // 91 / 10 => 9.1 => 10개
        totBlock = (int)Math.ceil(count / blockScale);
    }
     
    public int getCurBlock() {
        return curBlock;
    }
    public void setCurBlock(int curBlock) {
        this.curBlock = curBlock;
    }
    public int getPrevBlock() {
        return prevBlock;
    }
    public void setPrevBlock(int prevBlock) {
        this.prevBlock = prevBlock;
    }
    public int getNextBlock() {
        return nextBlock;
    }
    public void setNextBlock(int nextBlock) {
        this.nextBlock = nextBlock;
    }
    public int getPageBegin() {
        return pageBegin;
    }
    public void setPageBegin(int pageBegin) {
        this.pageBegin = pageBegin;
    }
    public int getPageEnd() {
        return pageEnd;
    }
    public void setPageEnd(int pageEnd) {
        this.pageEnd = pageEnd;
    }
    public int getBlockBegin() {
        return blockBegin;
    }
    public void setBlockBegin(int blockBegin) {
        this.blockBegin = blockBegin;
    }
    public int getBlockEnd() {
        return blockEnd;
    }
    public void setBlockEnd(int blockEnd) {
        this.blockEnd = blockEnd;
    }
}
