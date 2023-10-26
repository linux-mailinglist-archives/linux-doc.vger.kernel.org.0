Return-Path: <linux-doc+bounces-1172-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A6A7D7F73
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 11:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E4041C20D25
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 09:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922AC273F3;
	Thu, 26 Oct 2023 09:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="HC4zJsgv"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3BD262B1
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 09:18:49 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B535184
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 02:18:44 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20231026091840epoutp031b548485902414143c6b13c75b5c92e9~RnbF3Dp3u1385013850epoutp03g
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 09:18:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20231026091840epoutp031b548485902414143c6b13c75b5c92e9~RnbF3Dp3u1385013850epoutp03g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1698311920;
	bh=1jlqm5B7a5HrDAWxGSt5eGfgZ2O2WWBzWmFOcRhGomI=;
	h=Subject:Reply-To:From:To:In-Reply-To:Date:References:From;
	b=HC4zJsgvg9UmzKuLzfaUPkIlH9aX6MpYKM9lpvT4FsIt1qHA8q9eLAfHkX2V1d8aS
	 C4F9/2Iy4dUM2UGYGPHF71rBmDNPAWXIyLTiB8XLLCODCt4rMZQNMbYoYtbulMG4Ud
	 I9iYtOZYlfNWRAI+Ntm/1Nznk4c8AJ0LK6KGgvXY=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20231026091839epcas2p23a018ab390943a93f60296bd96e142a0~RnbFh0A2n0580405804epcas2p2L;
	Thu, 26 Oct 2023 09:18:39 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.90]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4SGKwb1C6Mz4x9Q1; Thu, 26 Oct
	2023 09:18:39 +0000 (GMT)
X-AuditID: b6c32a43-4b3ff700000021c8-3b-653a2eef0bff
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	26.57.08648.FEE2A356; Thu, 26 Oct 2023 18:18:39 +0900 (KST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: [f2fs-dev] [PATCH v1] f2fs: New victim selection for GC
Reply-To: yonggil.song@samsung.com
Sender: Yonggil Song <yonggil.song@samsung.com>
From: Yonggil Song <yonggil.song@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
	<chao@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
	"linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Seokhwan Kim <sukka.kim@samsung.com>, Daejun
	Park <daejun7.park@samsung.com>, Siwoo Jung <siu.jung@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20231012100345epcms2p84b95e24ee5e7965858ab8be99fbc3eff@epcms2p8>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20231026091838epcms2p46f14260fdaf53e27ee6374887ed87f41@epcms2p4>
Date: Thu, 26 Oct 2023 18:18:38 +0900
X-CMS-MailID: 20231026091838epcms2p46f14260fdaf53e27ee6374887ed87f41
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAJsWRmVeSWpSXmKPExsWy7bCmqe57PatUg/PP2CxOTz3LZPHkQDuj
	xaoH4RZP1s9itljYtoTF4tIid4vLu+awWZyf+JrJYlXHXEaLqeePMDlweWxa1cnmsXvBZyaP
	xX2TWT36tqxi9Pi8SS6ANSrbJiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8x
	N9VWycUnQNctMwfoJiWFssScUqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpOgXmBXnFibnFp
	XrpeXmqJlaGBgZEpUGFCdsb5Y/9ZC44HVKya/5m9gXGjfRcjJ4eEgInE2gVHmUBsIYEdjBIN
	J627GDk4eAUEJf7uEAYJCws4SCxv2sUIUaIkce1ALwtEXF9i8+Jl7CA2m4CuxN8Ny8FsEYG9
	zBI9H3MgxvNKzGh/ygJhS0tsX74VbA6ngJ/EiRlH2CDiGhI/lvUyQ9iiEjdXv2WHsd8fm88I
	YYtItN47C1UjKPHg526ouKTEokPnmSDsfIm/K65DzayR2NrQBhXXl7jWsRHsBl4BX4knT0Dm
	cHCwCKhKXG+QBjElBFwkVm3nAalgFpCX2P52DlgFs4CmxPpd+hAVyhJHbrFAVPBJdBz+yw7z
	3455T6D2qEls3rSZFcKWkbjwuA3qRg+J6Tu3A9VwAcNvKqPEuf8fWSYwKsxCBPMsJItnISxe
	wMi8ilEstaA4Nz012ajAEB6xyfm5mxjBSVPLeQfjlfn/9A4xMnEwHmKU4GBWEuGN9LFIFeJN
	SaysSi3Kjy8qzUktPsRoCvTwRGYp0eR8YNrOK4k3NLE0MDEzMzQ3MjUwVxLnvdc6N0VIID2x
	JDU7NbUgtQimj4mDU6qB6URpfeFt3cuKDatmbH/Pv//v+rTT/jsO7ZFc8lPg1G/L54UeIRXV
	5/593HPiZcR0m3SOWQ5HJfdsmsht77v6Jcv/40lhO/OeBVROUWJo7/ry8Ur2g9I/IRXKHU+u
	MsQE7NH/8WTNlo9tLU+XXCp9+P/7tsaO/1OVPV+8je1XDlK3Nw8tOPPTseT1Y7OMsC8/hIKW
	FwhZ9212uPss8uU+688xttO7/10qPnD1RvemmPCM1efeBNzetS1vWUXOhfO+euJ3Mw7rlXF7
	Tdh0d4a7p8Ne9gDfNSe+zl4QwMdceDBO2LRQ5WSI+vrWyl0vZjGzn9ty8cGSKHUH/gapU7bT
	L0yaO1uEm0flkflzg+rbp44osRRnJBpqMRcVJwIAaGH24CMEAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231012100345epcms2p84b95e24ee5e7965858ab8be99fbc3eff
References: <20231012100345epcms2p84b95e24ee5e7965858ab8be99fbc3eff@epcms2p8>
	<CGME20231012100345epcms2p84b95e24ee5e7965858ab8be99fbc3eff@epcms2p4>

Overview
========

Introduce a new way to select the data section first when selecting a
victim in foreground GC. This victim selection method works when the
prefer_data_victim mount option is enabled. If foreground GC migrates only
data sections and runs out of free sections, it cleans dirty node sections
to get more free sections.

Problem
=======

If the total amount of nodes is larger than the size of one section, nodes
occupy multiple sections, and node victims are often selected because the
gc cost is lowered by data block migration in foreground gc. Since moving
the data section causes frequent node victim selection, victim threshing
occurs in the node section. This results in an increase in WAF.

Experiment
==========

Test environment is as follows.

	System info
	  - 3.6GHz, 16 core CPU
	  - 36GiB Memory
	Device info
	  - a conventional null_blk with 228MiB
	  - a sequential null_blk with 4068 zones of 8MiB
	Format
	  - mkfs.f2fs <conv null_blk> -c <seq null_blk> -m -Z 8 -o 3.89
	Mount
	  - mount -o prefer_data_victim <conv null_blk> <mount point>
	Fio script
	  - fio --rw=randwrite --bs=4k --ba=4k --filesize=31187m --norandommap --overwrite=1 --name=job1 --filename=./mnt/sustain --io_size=128g
	WAF calculation
	  - (IOs on conv. null_blk + IOs on seq. null_blk) / random write IOs

Conclusion
==========

This experiment showed that the WAF was reduced by 29% (18.75 -> 13.3) when
the data section was selected first when selecting GC victims. This was
achieved by reducing the migration of the node blocks by 69.4%
(253,131,743 blks -> 77,463,278 blks). It is possible to achieve low WAF
performance with the GC victim selection method in environments where the
section size is relatively small.

Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
---
 Documentation/filesystems/f2fs.rst |   3 +
 fs/f2fs/f2fs.h                     |   2 +
 fs/f2fs/gc.c                       | 100 +++++++++++++++++++++++------
 fs/f2fs/segment.h                  |   2 +
 fs/f2fs/super.c                    |   9 +++
 5 files changed, 95 insertions(+), 21 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index d32c6209685d..58e6d001d7ab 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -367,6 +367,9 @@ errors=%s		 Specify f2fs behavior on critical errors. This supports modes:
 			 pending node write	drop		keep		N/A
 			 pending meta write	keep		keep		N/A
 			 ====================== =============== =============== ========
+prefer_data_victim	 When selecting victims in foreground GC, victims of data type
+			 are prioritized. This option minimizes GC victim threshing
+			 in the node section to reduce WAF.
 ======================== ============================================================
 
 Debugfs Entries
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6d688e42d89c..8b31fa2ea09a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -108,6 +108,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
 #define	F2FS_MOUNT_GC_MERGE		0x02000000
 #define F2FS_MOUNT_COMPRESS_CACHE	0x04000000
 #define F2FS_MOUNT_AGE_EXTENT_CACHE	0x08000000
+#define F2FS_MOUNT_PREFER_DATA_VICTIM	0x10000000
 
 #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
 #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
@@ -1648,6 +1649,7 @@ struct f2fs_sb_info {
 	struct f2fs_mount_info mount_opt;	/* mount options */
 
 	/* for cleaning operations */
+	bool need_node_clean;			/* only used for prefer_data_victim */
 	struct f2fs_rwsem gc_lock;		/*
 						 * semaphore for GC, avoid
 						 * race between GC and GC or CP
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index f550cdeaa663..8a2da808a5fb 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -752,6 +752,8 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 	unsigned int last_segment;
 	unsigned int nsearched;
 	bool is_atgc;
+	bool is_prefer_data_victim =
+		test_opt(sbi, PREFER_DATA_VICTIM) && gc_type == FG_GC;
 	int ret = 0;
 
 	mutex_lock(&dirty_i->seglist_lock);
@@ -767,6 +769,11 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 	p.oldest_age = 0;
 	p.min_cost = get_max_cost(sbi, &p);
 
+	if (is_prefer_data_victim) {
+		p.node_min_cost = p.min_cost;
+		p.node_min_segno = p.min_segno;
+	}
+
 	is_atgc = (p.gc_mode == GC_AT || p.alloc_mode == AT_SSR);
 	nsearched = 0;
 
@@ -884,9 +891,25 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 
 		cost = get_gc_cost(sbi, segno, &p);
 
-		if (p.min_cost > cost) {
-			p.min_segno = segno;
-			p.min_cost = cost;
+		if (is_prefer_data_victim) {
+			if (IS_DATASEG(get_seg_entry(sbi, segno)->type)) {
+				/* update data segments victim */
+				if (p.min_cost > cost) {
+					p.min_segno = segno;
+					p.min_cost = cost;
+				}
+			} else {
+				/* update node segments victim */
+				if (p.node_min_cost > cost) {
+					p.node_min_segno = segno;
+					p.node_min_cost = cost;
+				}
+			}
+		} else {
+			if (p.min_cost > cost) {
+				p.min_segno = segno;
+				p.min_cost = cost;
+			}
 		}
 next:
 		if (nsearched >= p.max_search) {
@@ -901,6 +924,25 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 		}
 	}
 
+	if (is_prefer_data_victim && sbi->need_node_clean) {
+		/* we need to clean node sections */
+		if (p.min_cost > p.node_min_cost) {
+			p.min_segno = p.node_min_segno;
+			p.min_cost = p.node_min_cost;
+		} else {
+			/*
+			 * data victim cost is the lowest.
+			 * if free sections are enough, stop cleaning node victim.
+			 * if not, it goes on by GCing data victims.
+			 */
+			if (has_enough_free_secs(sbi, prefree_segments(sbi), 0)) {
+				sbi->need_node_clean = false;
+				p.min_segno = NULL_SEGNO;
+				goto out;
+			}
+		}
+	}
+
 	/* get victim for GC_AT/AT_SSR */
 	if (is_atgc) {
 		lookup_victim_by_age(sbi, &p);
@@ -1830,8 +1872,27 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 		goto stop;
 	}
 
+	__get_secs_required(sbi, NULL, &upper_secs, NULL);
+
+	/*
+	 * Write checkpoint to reclaim prefree segments.
+	 * We need more three extra sections for writer's data/node/dentry.
+	 */
+	if (free_sections(sbi) <= upper_secs + NR_GC_CHECKPOINT_SECS) {
+		if (test_opt(sbi, PREFER_DATA_VICTIM)) {
+			sbi->need_node_clean = true;
+		}
+		if (prefree_segments(sbi)) {
+			ret = f2fs_write_checkpoint(sbi, &cpc);
+			if (ret)
+				goto stop;
+			/* Reset due to checkpoint */
+			sec_freed = 0;
+		}
+	}
+
 	/* Let's run FG_GC, if we don't have enough space. */
-	if (has_not_enough_free_secs(sbi, 0, 0)) {
+	if (gc_type == BG_GC && has_not_enough_free_secs(sbi, 0, 0)) {
 		gc_type = FG_GC;
 
 		/*
@@ -1882,7 +1943,17 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 			if (!gc_control->no_bg_gc &&
 			    total_sec_freed < gc_control->nr_free_secs)
 				goto go_gc_more;
-			goto stop;
+			if (test_opt(sbi, PREFER_DATA_VICTIM)) {
+				/*
+				 * If the need_node_clean flag is set
+				 * even though there are enough free
+				 * sections, node cleaning will continue.
+				 */
+				if (!sbi->need_node_clean)
+					goto stop;
+			} else {
+				goto stop;
+			}
 		}
 		if (sbi->skipped_gc_rwsem)
 			skipped_round++;
@@ -1897,21 +1968,6 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 		goto stop;
 	}
 
-	__get_secs_required(sbi, NULL, &upper_secs, NULL);
-
-	/*
-	 * Write checkpoint to reclaim prefree segments.
-	 * We need more three extra sections for writer's data/node/dentry.
-	 */
-	if (free_sections(sbi) <= upper_secs + NR_GC_CHECKPOINT_SECS &&
-				prefree_segments(sbi)) {
-		stat_inc_cp_call_count(sbi, TOTAL_CALL);
-		ret = f2fs_write_checkpoint(sbi, &cpc);
-		if (ret)
-			goto stop;
-		/* Reset due to checkpoint */
-		sec_freed = 0;
-	}
 go_gc_more:
 	segno = NULL_SEGNO;
 	goto gc_more;
@@ -1920,8 +1976,10 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 	SIT_I(sbi)->last_victim[ALLOC_NEXT] = 0;
 	SIT_I(sbi)->last_victim[FLUSH_DEVICE] = gc_control->victim_segno;
 
-	if (gc_type == FG_GC)
+	if (gc_type == FG_GC) {
 		f2fs_unpin_all_sections(sbi, true);
+		sbi->need_node_clean = false;
+	}
 
 	trace_f2fs_gc_end(sbi->sb, ret, total_freed, total_sec_freed,
 				get_pages(sbi, F2FS_DIRTY_NODES),
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 2ca8fb5d0dc4..d55fa1fee2e0 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -197,8 +197,10 @@ struct victim_sel_policy {
 	unsigned int offset;		/* last scanned bitmap offset */
 	unsigned int ofs_unit;		/* bitmap search unit */
 	unsigned int min_cost;		/* minimum cost */
+	unsigned int node_min_cost;	/* minimum cost of node type section */
 	unsigned long long oldest_age;	/* oldest age of segments having the same min cost */
 	unsigned int min_segno;		/* segment # having min. cost */
+	unsigned int node_min_segno;	/* node segment # having min. cost */
 	unsigned long long age;		/* mtime of GCed section*/
 	unsigned long long age_threshold;/* age threshold */
 };
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index a8c8232852bb..133137dd6fd0 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -165,6 +165,7 @@ enum {
 	Opt_memory_mode,
 	Opt_age_extent_cache,
 	Opt_errors,
+	Opt_prefer_data_victim,
 	Opt_err,
 };
 
@@ -245,6 +246,7 @@ static match_table_t f2fs_tokens = {
 	{Opt_memory_mode, "memory=%s"},
 	{Opt_age_extent_cache, "age_extent_cache"},
 	{Opt_errors, "errors=%s"},
+	{Opt_prefer_data_victim, "prefer_data_victim"},
 	{Opt_err, NULL},
 };
 
@@ -1286,6 +1288,13 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			}
 			kfree(name);
 			break;
+		case Opt_prefer_data_victim:
+			if (!f2fs_sb_has_blkzoned(sbi)) {
+				f2fs_err(sbi, "prefer_data_victim is only allowed with zoned block device feature");
+				return -EINVAL;
+			}
+			set_opt(sbi, PREFER_DATA_VICTIM);
+			break;
 		default:
 			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
 				 p);
-- 
2.34.1


