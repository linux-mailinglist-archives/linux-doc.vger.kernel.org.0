Return-Path: <linux-doc+bounces-2566-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A18717EF700
	for <lists+linux-doc@lfdr.de>; Fri, 17 Nov 2023 18:34:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB77EB20A1B
	for <lists+linux-doc@lfdr.de>; Fri, 17 Nov 2023 17:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A8B37142;
	Fri, 17 Nov 2023 17:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLsHRNX5"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B19930CE1
	for <linux-doc@vger.kernel.org>; Fri, 17 Nov 2023 17:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88C2C433C7;
	Fri, 17 Nov 2023 17:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700242485;
	bh=dU6F6KYQ5xcTXstkyIXqNswrqkxjmrUehbH9HfHmuWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jLsHRNX5mKo3o67+gdMvAq85UtBwfGksIyx3BJmnCurifPqR65GiljkzvlZDRK4kn
	 GoCfYtL1SiqG/OJVI17eorH2ny1hKlsEAyxWayaAjkxRrOnHf+WmdzwoWsukt+QR6V
	 X+Z6jVaO708mH75MWGYpdTAtWWvJl3xaEIHjR543ZubNJR4Yuw3/ZL+0VlkOc53TcQ
	 +YQRLEcKVZWaR5fbEBe47BtSLI+7FeSbCJZM+grqJLFPc/9XLNXgPB/kHl1Lyn4qxT
	 RycL36XoWo5hNi4+oacRMZiLBOHCA0FqJ9+CIF9PmmDUmty9ZbAgATfNlzgV/ewn2M
	 WlH7MqT11rp9Q==
Date: Fri, 17 Nov 2023 09:34:43 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yonggil Song <yonggil.song@samsung.com>
Cc: "chao@kernel.org" <chao@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
	"linux-f2fs-devel@lists.sourceforge.net" <linux-f2fs-devel@lists.sourceforge.net>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Seokhwan Kim <sukka.kim@samsung.com>,
	Daejun Park <daejun7.park@samsung.com>,
	Siwoo Jung <siu.jung@samsung.com>
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: New victim selection for GC
Message-ID: <ZVekM0GmX-Jz4T0C@google.com>
References: <20231012100345epcms2p84b95e24ee5e7965858ab8be99fbc3eff@epcms2p8>
 <CGME20231012100345epcms2p84b95e24ee5e7965858ab8be99fbc3eff@epcms2p4>
 <20231026091838epcms2p46f14260fdaf53e27ee6374887ed87f41@epcms2p4>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026091838epcms2p46f14260fdaf53e27ee6374887ed87f41@epcms2p4>

Hi Yonggil,

On 10/26, Yonggil Song wrote:
> Overview
> ========
> 
> Introduce a new way to select the data section first when selecting a
> victim in foreground GC. This victim selection method works when the
> prefer_data_victim mount option is enabled. If foreground GC migrates only
> data sections and runs out of free sections, it cleans dirty node sections
> to get more free sections.
> 
> Problem
> =======
> 
> If the total amount of nodes is larger than the size of one section, nodes
> occupy multiple sections, and node victims are often selected because the
> gc cost is lowered by data block migration in foreground gc. Since moving
> the data section causes frequent node victim selection, victim threshing
> occurs in the node section. This results in an increase in WAF.

How does that work w/ ATGC?

> 
> Experiment
> ==========
> 
> Test environment is as follows.
> 
> 	System info
> 	  - 3.6GHz, 16 core CPU
> 	  - 36GiB Memory
> 	Device info
> 	  - a conventional null_blk with 228MiB
> 	  - a sequential null_blk with 4068 zones of 8MiB
> 	Format
> 	  - mkfs.f2fs <conv null_blk> -c <seq null_blk> -m -Z 8 -o 3.89
> 	Mount
> 	  - mount -o prefer_data_victim <conv null_blk> <mount point>
> 	Fio script
> 	  - fio --rw=randwrite --bs=4k --ba=4k --filesize=31187m --norandommap --overwrite=1 --name=job1 --filename=./mnt/sustain --io_size=128g
> 	WAF calculation
> 	  - (IOs on conv. null_blk + IOs on seq. null_blk) / random write IOs
> 
> Conclusion
> ==========
> 
> This experiment showed that the WAF was reduced by 29% (18.75 -> 13.3) when
> the data section was selected first when selecting GC victims. This was
> achieved by reducing the migration of the node blocks by 69.4%
> (253,131,743 blks -> 77,463,278 blks). It is possible to achieve low WAF
> performance with the GC victim selection method in environments where the
> section size is relatively small.
> 
> Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
> ---
>  Documentation/filesystems/f2fs.rst |   3 +
>  fs/f2fs/f2fs.h                     |   2 +
>  fs/f2fs/gc.c                       | 100 +++++++++++++++++++++++------
>  fs/f2fs/segment.h                  |   2 +
>  fs/f2fs/super.c                    |   9 +++
>  5 files changed, 95 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index d32c6209685d..58e6d001d7ab 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -367,6 +367,9 @@ errors=%s		 Specify f2fs behavior on critical errors. This supports modes:
>  			 pending node write	drop		keep		N/A
>  			 pending meta write	keep		keep		N/A
>  			 ====================== =============== =============== ========
> +prefer_data_victim	 When selecting victims in foreground GC, victims of data type
> +			 are prioritized. This option minimizes GC victim threshing
> +			 in the node section to reduce WAF.
>  ======================== ============================================================
>  
>  Debugfs Entries
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 6d688e42d89c..8b31fa2ea09a 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -108,6 +108,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
>  #define	F2FS_MOUNT_GC_MERGE		0x02000000
>  #define F2FS_MOUNT_COMPRESS_CACHE	0x04000000
>  #define F2FS_MOUNT_AGE_EXTENT_CACHE	0x08000000
> +#define F2FS_MOUNT_PREFER_DATA_VICTIM	0x10000000
>  
>  #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
>  #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
> @@ -1648,6 +1649,7 @@ struct f2fs_sb_info {
>  	struct f2fs_mount_info mount_opt;	/* mount options */
>  
>  	/* for cleaning operations */
> +	bool need_node_clean;			/* only used for prefer_data_victim */
>  	struct f2fs_rwsem gc_lock;		/*
>  						 * semaphore for GC, avoid
>  						 * race between GC and GC or CP
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index f550cdeaa663..8a2da808a5fb 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -752,6 +752,8 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
>  	unsigned int last_segment;
>  	unsigned int nsearched;
>  	bool is_atgc;
> +	bool is_prefer_data_victim =
> +		test_opt(sbi, PREFER_DATA_VICTIM) && gc_type == FG_GC;
>  	int ret = 0;
>  
>  	mutex_lock(&dirty_i->seglist_lock);
> @@ -767,6 +769,11 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
>  	p.oldest_age = 0;
>  	p.min_cost = get_max_cost(sbi, &p);
>  
> +	if (is_prefer_data_victim) {
> +		p.node_min_cost = p.min_cost;
> +		p.node_min_segno = p.min_segno;
> +	}
> +
>  	is_atgc = (p.gc_mode == GC_AT || p.alloc_mode == AT_SSR);
>  	nsearched = 0;
>  
> @@ -884,9 +891,25 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
>  
>  		cost = get_gc_cost(sbi, segno, &p);
>  
> -		if (p.min_cost > cost) {
> -			p.min_segno = segno;
> -			p.min_cost = cost;
> +		if (is_prefer_data_victim) {
> +			if (IS_DATASEG(get_seg_entry(sbi, segno)->type)) {
> +				/* update data segments victim */
> +				if (p.min_cost > cost) {
> +					p.min_segno = segno;
> +					p.min_cost = cost;
> +				}
> +			} else {
> +				/* update node segments victim */
> +				if (p.node_min_cost > cost) {
> +					p.node_min_segno = segno;
> +					p.node_min_cost = cost;
> +				}
> +			}
> +		} else {
> +			if (p.min_cost > cost) {
> +				p.min_segno = segno;
> +				p.min_cost = cost;
> +			}
>  		}
>  next:
>  		if (nsearched >= p.max_search) {
> @@ -901,6 +924,25 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
>  		}
>  	}
>  
> +	if (is_prefer_data_victim && sbi->need_node_clean) {
> +		/* we need to clean node sections */
> +		if (p.min_cost > p.node_min_cost) {
> +			p.min_segno = p.node_min_segno;
> +			p.min_cost = p.node_min_cost;
> +		} else {
> +			/*
> +			 * data victim cost is the lowest.
> +			 * if free sections are enough, stop cleaning node victim.
> +			 * if not, it goes on by GCing data victims.
> +			 */
> +			if (has_enough_free_secs(sbi, prefree_segments(sbi), 0)) {
> +				sbi->need_node_clean = false;
> +				p.min_segno = NULL_SEGNO;
> +				goto out;
> +			}
> +		}
> +	}
> +
>  	/* get victim for GC_AT/AT_SSR */
>  	if (is_atgc) {
>  		lookup_victim_by_age(sbi, &p);
> @@ -1830,8 +1872,27 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>  		goto stop;
>  	}
>  
> +	__get_secs_required(sbi, NULL, &upper_secs, NULL);
> +
> +	/*
> +	 * Write checkpoint to reclaim prefree segments.
> +	 * We need more three extra sections for writer's data/node/dentry.
> +	 */
> +	if (free_sections(sbi) <= upper_secs + NR_GC_CHECKPOINT_SECS) {
> +		if (test_opt(sbi, PREFER_DATA_VICTIM)) {
> +			sbi->need_node_clean = true;
> +		}
> +		if (prefree_segments(sbi)) {
> +			ret = f2fs_write_checkpoint(sbi, &cpc);
> +			if (ret)
> +				goto stop;
> +			/* Reset due to checkpoint */
> +			sec_freed = 0;
> +		}
> +	}
> +
>  	/* Let's run FG_GC, if we don't have enough space. */
> -	if (has_not_enough_free_secs(sbi, 0, 0)) {
> +	if (gc_type == BG_GC && has_not_enough_free_secs(sbi, 0, 0)) {
>  		gc_type = FG_GC;
>  
>  		/*
> @@ -1882,7 +1943,17 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>  			if (!gc_control->no_bg_gc &&
>  			    total_sec_freed < gc_control->nr_free_secs)
>  				goto go_gc_more;
> -			goto stop;
> +			if (test_opt(sbi, PREFER_DATA_VICTIM)) {
> +				/*
> +				 * If the need_node_clean flag is set
> +				 * even though there are enough free
> +				 * sections, node cleaning will continue.
> +				 */
> +				if (!sbi->need_node_clean)
> +					goto stop;
> +			} else {
> +				goto stop;
> +			}
>  		}
>  		if (sbi->skipped_gc_rwsem)
>  			skipped_round++;
> @@ -1897,21 +1968,6 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>  		goto stop;
>  	}
>  
> -	__get_secs_required(sbi, NULL, &upper_secs, NULL);
> -
> -	/*
> -	 * Write checkpoint to reclaim prefree segments.
> -	 * We need more three extra sections for writer's data/node/dentry.
> -	 */
> -	if (free_sections(sbi) <= upper_secs + NR_GC_CHECKPOINT_SECS &&
> -				prefree_segments(sbi)) {
> -		stat_inc_cp_call_count(sbi, TOTAL_CALL);
> -		ret = f2fs_write_checkpoint(sbi, &cpc);
> -		if (ret)
> -			goto stop;
> -		/* Reset due to checkpoint */
> -		sec_freed = 0;
> -	}
>  go_gc_more:
>  	segno = NULL_SEGNO;
>  	goto gc_more;
> @@ -1920,8 +1976,10 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>  	SIT_I(sbi)->last_victim[ALLOC_NEXT] = 0;
>  	SIT_I(sbi)->last_victim[FLUSH_DEVICE] = gc_control->victim_segno;
>  
> -	if (gc_type == FG_GC)
> +	if (gc_type == FG_GC) {
>  		f2fs_unpin_all_sections(sbi, true);
> +		sbi->need_node_clean = false;
> +	}
>  
>  	trace_f2fs_gc_end(sbi->sb, ret, total_freed, total_sec_freed,
>  				get_pages(sbi, F2FS_DIRTY_NODES),
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 2ca8fb5d0dc4..d55fa1fee2e0 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -197,8 +197,10 @@ struct victim_sel_policy {
>  	unsigned int offset;		/* last scanned bitmap offset */
>  	unsigned int ofs_unit;		/* bitmap search unit */
>  	unsigned int min_cost;		/* minimum cost */
> +	unsigned int node_min_cost;	/* minimum cost of node type section */
>  	unsigned long long oldest_age;	/* oldest age of segments having the same min cost */
>  	unsigned int min_segno;		/* segment # having min. cost */
> +	unsigned int node_min_segno;	/* node segment # having min. cost */
>  	unsigned long long age;		/* mtime of GCed section*/
>  	unsigned long long age_threshold;/* age threshold */
>  };
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index a8c8232852bb..133137dd6fd0 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -165,6 +165,7 @@ enum {
>  	Opt_memory_mode,
>  	Opt_age_extent_cache,
>  	Opt_errors,
> +	Opt_prefer_data_victim,
>  	Opt_err,
>  };
>  
> @@ -245,6 +246,7 @@ static match_table_t f2fs_tokens = {
>  	{Opt_memory_mode, "memory=%s"},
>  	{Opt_age_extent_cache, "age_extent_cache"},
>  	{Opt_errors, "errors=%s"},
> +	{Opt_prefer_data_victim, "prefer_data_victim"},
>  	{Opt_err, NULL},
>  };
>  
> @@ -1286,6 +1288,13 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  			}
>  			kfree(name);
>  			break;
> +		case Opt_prefer_data_victim:
> +			if (!f2fs_sb_has_blkzoned(sbi)) {
> +				f2fs_err(sbi, "prefer_data_victim is only allowed with zoned block device feature");
> +				return -EINVAL;
> +			}
> +			set_opt(sbi, PREFER_DATA_VICTIM);
> +			break;
>  		default:
>  			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
>  				 p);
> -- 
> 2.34.1

