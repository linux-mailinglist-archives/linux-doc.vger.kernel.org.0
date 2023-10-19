Return-Path: <linux-doc+bounces-606-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D37A27CF45A
	for <lists+linux-doc@lfdr.de>; Thu, 19 Oct 2023 11:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 029E61C20996
	for <lists+linux-doc@lfdr.de>; Thu, 19 Oct 2023 09:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A0114F6D;
	Thu, 19 Oct 2023 09:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lEXufk4R"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B50E171DE
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 09:47:42 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93938116;
	Thu, 19 Oct 2023 02:47:40 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39J7ttDm030817;
	Thu, 19 Oct 2023 09:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=mtjmkN1oxTwVANe3TQIINSWKb9qQZMJkO7ai8fg+eGc=;
 b=lEXufk4RMphfsLKecP6k+5231ncJrHJ4Ve+2eOZ7a1Wl9+cJw3QkIcgyYR3cm+Mkwk+M
 X1ZM6CWEPCNyIuQEHuldBADpgPjYxzYJA3aA48YqeI/jhC6Z2aTRuTSLZxNFXk+NP1ZZ
 aWiSq9okCbhxbJFiHqiKxSYGb7CNgHCocUQPPoEaqgUl2puR/XCW8aQ+V9+sSVkYX/06
 +iH1uWIJeSzllW7g3lNtJJJCBo5DUaauyryitbgSQfVe4dmYyVLSZlak6Qo4ISBbVQLR
 ir9bFVqLyoDjNlVkGVxodJHjREN1eWNLiykObEOTY/ZQ3RpN/SxlsshcADL3QLo3vUQx tQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ttcuv2u5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 09:47:26 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39J9lOc7012203
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 09:47:24 GMT
Received: from hu-nprakash-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Thu, 19 Oct 2023 02:47:18 -0700
From: Nikhil V <quic_nprakash@quicinc.com>
To: Pavel Machek <pavel@ucw.cz>, "Rafael J. Wysocki" <rafael@kernel.org>,
        "Len
 Brown" <len.brown@intel.com>
CC: Nikhil V <quic_nprakash@quicinc.com>, Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Peter Zijlstra
	<peterz@infradead.org>,
        "Steven Rostedt (Google)" <rostedt@goodmis.org>,
        "Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>,
        "Randy
 Dunlap" <rdunlap@infradead.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <quic_pkondeti@quicinc.com>, <quic_kprasan@quicinc.com>,
        <quic_mpilaniy@quicinc.com>, <quic_shrekk@quicinc.com>,
        <mpleshivenkov@google.com>, <ericyin@google.com>
Subject: [PATCH v2 1/4] PM: hibernate: Rename lzo* to make it generic
Date: Thu, 19 Oct 2023 15:16:34 +0530
Message-ID: <1c1d623178a9d03a8fe93aafa2186b43bc88e579.1697707408.git.quic_nprakash@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1697707408.git.quic_nprakash@quicinc.com>
References: <cover.1697707408.git.quic_nprakash@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xdQLoiUOab13uBPLEEmh4t9y1v8DwJYt
X-Proofpoint-GUID: xdQLoiUOab13uBPLEEmh4t9y1v8DwJYt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_07,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=995 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190082

Renaming lzo* to generic names, except for lzo_xxx() APIs. This is
used in the next patch where we move to crypto based APIs for
compression. There are no functional changes introduced by this
approach.

Signed-off-by: Nikhil V <quic_nprakash@quicinc.com>
---
 kernel/power/swap.c | 122 ++++++++++++++++++++++----------------------
 1 file changed, 61 insertions(+), 61 deletions(-)

diff --git a/kernel/power/swap.c b/kernel/power/swap.c
index 74edbce2320b..139fb33778a0 100644
--- a/kernel/power/swap.c
+++ b/kernel/power/swap.c
@@ -514,23 +514,23 @@ static int swap_writer_finish(struct swap_map_handle *handle,
 }
 
 /* We need to remember how much compressed data we need to read. */
-#define LZO_HEADER	sizeof(size_t)
+#define CMP_HEADER	sizeof(size_t)
 
 /* Number of pages/bytes we'll compress at one time. */
-#define LZO_UNC_PAGES	32
-#define LZO_UNC_SIZE	(LZO_UNC_PAGES * PAGE_SIZE)
+#define UNC_PAGES	32
+#define UNC_SIZE	(UNC_PAGES * PAGE_SIZE)
 
-/* Number of pages/bytes we need for compressed data (worst case). */
-#define LZO_CMP_PAGES	DIV_ROUND_UP(lzo1x_worst_compress(LZO_UNC_SIZE) + \
-			             LZO_HEADER, PAGE_SIZE)
-#define LZO_CMP_SIZE	(LZO_CMP_PAGES * PAGE_SIZE)
+/* Number of pages we need for compressed data (worst case). */
+#define CMP_PAGES	DIV_ROUND_UP(lzo1x_worst_compress(UNC_SIZE) + \
+				CMP_HEADER, PAGE_SIZE)
+#define CMP_SIZE	(CMP_PAGES * PAGE_SIZE)
 
 /* Maximum number of threads for compression/decompression. */
-#define LZO_THREADS	3
+#define CMP_THREADS	3
 
 /* Minimum/maximum number of pages for read buffering. */
-#define LZO_MIN_RD_PAGES	1024
-#define LZO_MAX_RD_PAGES	8192
+#define CMP_MIN_RD_PAGES	1024
+#define CMP_MAX_RD_PAGES	8192
 
 
 /**
@@ -592,8 +592,8 @@ struct crc_data {
 	wait_queue_head_t go;                     /* start crc update */
 	wait_queue_head_t done;                   /* crc update done */
 	u32 *crc32;                               /* points to handle's crc32 */
-	size_t *unc_len[LZO_THREADS];             /* uncompressed lengths */
-	unsigned char *unc[LZO_THREADS];          /* uncompressed data */
+	size_t *unc_len[CMP_THREADS];             /* uncompressed lengths */
+	unsigned char *unc[CMP_THREADS];          /* uncompressed data */
 };
 
 /*
@@ -624,7 +624,7 @@ static int crc32_threadfn(void *data)
 	return 0;
 }
 /*
- * Structure used for LZO data compression.
+ * Structure used for data compression.
  */
 struct cmp_data {
 	struct task_struct *thr;                  /* thread */
@@ -635,15 +635,15 @@ struct cmp_data {
 	wait_queue_head_t done;                   /* compression done */
 	size_t unc_len;                           /* uncompressed length */
 	size_t cmp_len;                           /* compressed length */
-	unsigned char unc[LZO_UNC_SIZE];          /* uncompressed buffer */
-	unsigned char cmp[LZO_CMP_SIZE];          /* compressed buffer */
+	unsigned char unc[UNC_SIZE];              /* uncompressed buffer */
+	unsigned char cmp[CMP_SIZE];              /* compressed buffer */
 	unsigned char wrk[LZO1X_1_MEM_COMPRESS];  /* compression workspace */
 };
 
 /*
  * Compression function that runs in its own thread.
  */
-static int lzo_compress_threadfn(void *data)
+static int compress_threadfn(void *data)
 {
 	struct cmp_data *d = data;
 
@@ -660,8 +660,8 @@ static int lzo_compress_threadfn(void *data)
 		atomic_set(&d->ready, 0);
 
 		d->ret = lzo1x_1_compress(d->unc, d->unc_len,
-		                          d->cmp + LZO_HEADER, &d->cmp_len,
-		                          d->wrk);
+					  d->cmp + CMP_HEADER, &d->cmp_len,
+					  d->wrk);
 		atomic_set(&d->stop, 1);
 		wake_up(&d->done);
 	}
@@ -669,14 +669,14 @@ static int lzo_compress_threadfn(void *data)
 }
 
 /**
- * save_image_lzo - Save the suspend image data compressed with LZO.
+ * save_compressed_image - Save the suspend image data after compression.
  * @handle: Swap map handle to use for saving the image.
  * @snapshot: Image to read data from.
  * @nr_to_write: Number of pages to save.
  */
-static int save_image_lzo(struct swap_map_handle *handle,
-                          struct snapshot_handle *snapshot,
-                          unsigned int nr_to_write)
+static int save_compressed_image(struct swap_map_handle *handle,
+				 struct snapshot_handle *snapshot,
+				 unsigned int nr_to_write)
 {
 	unsigned int m;
 	int ret = 0;
@@ -698,18 +698,18 @@ static int save_image_lzo(struct swap_map_handle *handle,
 	 * footprint.
 	 */
 	nr_threads = num_online_cpus() - 1;
-	nr_threads = clamp_val(nr_threads, 1, LZO_THREADS);
+	nr_threads = clamp_val(nr_threads, 1, CMP_THREADS);
 
 	page = (void *)__get_free_page(GFP_NOIO | __GFP_HIGH);
 	if (!page) {
-		pr_err("Failed to allocate LZO page\n");
+		pr_err("Failed to allocate compression page\n");
 		ret = -ENOMEM;
 		goto out_clean;
 	}
 
 	data = vzalloc(array_size(nr_threads, sizeof(*data)));
 	if (!data) {
-		pr_err("Failed to allocate LZO data\n");
+		pr_err("Failed to allocate compression data\n");
 		ret = -ENOMEM;
 		goto out_clean;
 	}
@@ -728,7 +728,7 @@ static int save_image_lzo(struct swap_map_handle *handle,
 		init_waitqueue_head(&data[thr].go);
 		init_waitqueue_head(&data[thr].done);
 
-		data[thr].thr = kthread_run(lzo_compress_threadfn,
+		data[thr].thr = kthread_run(compress_threadfn,
 		                            &data[thr],
 		                            "image_compress/%u", thr);
 		if (IS_ERR(data[thr].thr)) {
@@ -776,7 +776,7 @@ static int save_image_lzo(struct swap_map_handle *handle,
 	start = ktime_get();
 	for (;;) {
 		for (thr = 0; thr < nr_threads; thr++) {
-			for (off = 0; off < LZO_UNC_SIZE; off += PAGE_SIZE) {
+			for (off = 0; off < UNC_SIZE; off += PAGE_SIZE) {
 				ret = snapshot_read_next(snapshot);
 				if (ret < 0)
 					goto out_finish;
@@ -816,14 +816,14 @@ static int save_image_lzo(struct swap_map_handle *handle,
 			ret = data[thr].ret;
 
 			if (ret < 0) {
-				pr_err("LZO compression failed\n");
+				pr_err("compression failed\n");
 				goto out_finish;
 			}
 
 			if (unlikely(!data[thr].cmp_len ||
 			             data[thr].cmp_len >
 			             lzo1x_worst_compress(data[thr].unc_len))) {
-				pr_err("Invalid LZO compressed length\n");
+				pr_err("Invalid compressed length\n");
 				ret = -1;
 				goto out_finish;
 			}
@@ -839,7 +839,7 @@ static int save_image_lzo(struct swap_map_handle *handle,
 			 * read it.
 			 */
 			for (off = 0;
-			     off < LZO_HEADER + data[thr].cmp_len;
+			     off < CMP_HEADER + data[thr].cmp_len;
 			     off += PAGE_SIZE) {
 				memcpy(page, data[thr].cmp + off, PAGE_SIZE);
 
@@ -941,7 +941,7 @@ int swsusp_write(unsigned int flags)
 	if (!error) {
 		error = (flags & SF_NOCOMPRESS_MODE) ?
 			save_image(&handle, &snapshot, pages - 1) :
-			save_image_lzo(&handle, &snapshot, pages - 1);
+			save_compressed_image(&handle, &snapshot, pages - 1);
 	}
 out_finish:
 	error = swap_writer_finish(&handle, flags, error);
@@ -1108,7 +1108,7 @@ static int load_image(struct swap_map_handle *handle,
 }
 
 /*
- * Structure used for LZO data decompression.
+ * Structure used for data decompression.
  */
 struct dec_data {
 	struct task_struct *thr;                  /* thread */
@@ -1119,14 +1119,14 @@ struct dec_data {
 	wait_queue_head_t done;                   /* decompression done */
 	size_t unc_len;                           /* uncompressed length */
 	size_t cmp_len;                           /* compressed length */
-	unsigned char unc[LZO_UNC_SIZE];          /* uncompressed buffer */
-	unsigned char cmp[LZO_CMP_SIZE];          /* compressed buffer */
+	unsigned char unc[UNC_SIZE];              /* uncompressed buffer */
+	unsigned char cmp[CMP_SIZE];              /* compressed buffer */
 };
 
 /*
  * Decompression function that runs in its own thread.
  */
-static int lzo_decompress_threadfn(void *data)
+static int decompress_threadfn(void *data)
 {
 	struct dec_data *d = data;
 
@@ -1142,9 +1142,9 @@ static int lzo_decompress_threadfn(void *data)
 		}
 		atomic_set(&d->ready, 0);
 
-		d->unc_len = LZO_UNC_SIZE;
-		d->ret = lzo1x_decompress_safe(d->cmp + LZO_HEADER, d->cmp_len,
-		                               d->unc, &d->unc_len);
+		d->unc_len = UNC_SIZE;
+		d->ret = lzo1x_decompress_safe(d->cmp + CMP_HEADER, d->cmp_len,
+					       d->unc, &d->unc_len);
 		if (clean_pages_on_decompress)
 			flush_icache_range((unsigned long)d->unc,
 					   (unsigned long)d->unc + d->unc_len);
@@ -1156,14 +1156,14 @@ static int lzo_decompress_threadfn(void *data)
 }
 
 /**
- * load_image_lzo - Load compressed image data and decompress them with LZO.
+ * load_compressed_image - Load compressed image data and decompress it.
  * @handle: Swap map handle to use for loading data.
  * @snapshot: Image to copy uncompressed data into.
  * @nr_to_read: Number of pages to load.
  */
-static int load_image_lzo(struct swap_map_handle *handle,
-                          struct snapshot_handle *snapshot,
-                          unsigned int nr_to_read)
+static int load_compressed_image(struct swap_map_handle *handle,
+				 struct snapshot_handle *snapshot,
+				 unsigned int nr_to_read)
 {
 	unsigned int m;
 	int ret = 0;
@@ -1188,18 +1188,18 @@ static int load_image_lzo(struct swap_map_handle *handle,
 	 * footprint.
 	 */
 	nr_threads = num_online_cpus() - 1;
-	nr_threads = clamp_val(nr_threads, 1, LZO_THREADS);
+	nr_threads = clamp_val(nr_threads, 1, CMP_THREADS);
 
-	page = vmalloc(array_size(LZO_MAX_RD_PAGES, sizeof(*page)));
+	page = vmalloc(array_size(CMP_MAX_RD_PAGES, sizeof(*page)));
 	if (!page) {
-		pr_err("Failed to allocate LZO page\n");
+		pr_err("Failed to allocate compression page\n");
 		ret = -ENOMEM;
 		goto out_clean;
 	}
 
 	data = vzalloc(array_size(nr_threads, sizeof(*data)));
 	if (!data) {
-		pr_err("Failed to allocate LZO data\n");
+		pr_err("Failed to allocate compression data\n");
 		ret = -ENOMEM;
 		goto out_clean;
 	}
@@ -1220,7 +1220,7 @@ static int load_image_lzo(struct swap_map_handle *handle,
 		init_waitqueue_head(&data[thr].go);
 		init_waitqueue_head(&data[thr].done);
 
-		data[thr].thr = kthread_run(lzo_decompress_threadfn,
+		data[thr].thr = kthread_run(decompress_threadfn,
 		                            &data[thr],
 		                            "image_decompress/%u", thr);
 		if (IS_ERR(data[thr].thr)) {
@@ -1261,18 +1261,18 @@ static int load_image_lzo(struct swap_map_handle *handle,
 	 */
 	if (low_free_pages() > snapshot_get_image_size())
 		read_pages = (low_free_pages() - snapshot_get_image_size()) / 2;
-	read_pages = clamp_val(read_pages, LZO_MIN_RD_PAGES, LZO_MAX_RD_PAGES);
+	read_pages = clamp_val(read_pages, CMP_MIN_RD_PAGES, CMP_MAX_RD_PAGES);
 
 	for (i = 0; i < read_pages; i++) {
-		page[i] = (void *)__get_free_page(i < LZO_CMP_PAGES ?
+		page[i] = (void *)__get_free_page(i < CMP_PAGES ?
 						  GFP_NOIO | __GFP_HIGH :
 						  GFP_NOIO | __GFP_NOWARN |
 						  __GFP_NORETRY);
 
 		if (!page[i]) {
-			if (i < LZO_CMP_PAGES) {
+			if (i < CMP_PAGES) {
 				ring_size = i;
-				pr_err("Failed to allocate LZO pages\n");
+				pr_err("Failed to allocate compression pages\n");
 				ret = -ENOMEM;
 				goto out_clean;
 			} else {
@@ -1343,13 +1343,13 @@ static int load_image_lzo(struct swap_map_handle *handle,
 			data[thr].cmp_len = *(size_t *)page[pg];
 			if (unlikely(!data[thr].cmp_len ||
 			             data[thr].cmp_len >
-			             lzo1x_worst_compress(LZO_UNC_SIZE))) {
-				pr_err("Invalid LZO compressed length\n");
+					lzo1x_worst_compress(UNC_SIZE))) {
+				pr_err("Invalid compressed length\n");
 				ret = -1;
 				goto out_finish;
 			}
 
-			need = DIV_ROUND_UP(data[thr].cmp_len + LZO_HEADER,
+			need = DIV_ROUND_UP(data[thr].cmp_len + CMP_HEADER,
 			                    PAGE_SIZE);
 			if (need > have) {
 				if (eof > 1) {
@@ -1360,7 +1360,7 @@ static int load_image_lzo(struct swap_map_handle *handle,
 			}
 
 			for (off = 0;
-			     off < LZO_HEADER + data[thr].cmp_len;
+			     off < CMP_HEADER + data[thr].cmp_len;
 			     off += PAGE_SIZE) {
 				memcpy(data[thr].cmp + off,
 				       page[pg], PAGE_SIZE);
@@ -1377,7 +1377,7 @@ static int load_image_lzo(struct swap_map_handle *handle,
 		/*
 		 * Wait for more data while we are decompressing.
 		 */
-		if (have < LZO_CMP_PAGES && asked) {
+		if (have < CMP_PAGES && asked) {
 			ret = hib_wait_io(&hb);
 			if (ret)
 				goto out_finish;
@@ -1395,14 +1395,14 @@ static int load_image_lzo(struct swap_map_handle *handle,
 			ret = data[thr].ret;
 
 			if (ret < 0) {
-				pr_err("LZO decompression failed\n");
+				pr_err("decompression failed\n");
 				goto out_finish;
 			}
 
 			if (unlikely(!data[thr].unc_len ||
-			             data[thr].unc_len > LZO_UNC_SIZE ||
-			             data[thr].unc_len & (PAGE_SIZE - 1))) {
-				pr_err("Invalid LZO uncompressed length\n");
+				data[thr].unc_len > UNC_SIZE ||
+				data[thr].unc_len & (PAGE_SIZE - 1))) {
+				pr_err("Invalid uncompressed length\n");
 				ret = -1;
 				goto out_finish;
 			}
@@ -1499,7 +1499,7 @@ int swsusp_read(unsigned int *flags_p)
 	if (!error) {
 		error = (*flags_p & SF_NOCOMPRESS_MODE) ?
 			load_image(&handle, &snapshot, header->pages - 1) :
-			load_image_lzo(&handle, &snapshot, header->pages - 1);
+			load_compressed_image(&handle, &snapshot, header->pages - 1);
 	}
 	swap_reader_finish(&handle);
 end:
-- 
2.17.1


