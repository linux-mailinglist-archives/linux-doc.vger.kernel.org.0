Return-Path: <linux-doc+bounces-23143-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEDE956118
	for <lists+linux-doc@lfdr.de>; Mon, 19 Aug 2024 04:32:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A710A281D5E
	for <lists+linux-doc@lfdr.de>; Mon, 19 Aug 2024 02:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15EE843AB2;
	Mon, 19 Aug 2024 02:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VoKKLTkP"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8688381B1;
	Mon, 19 Aug 2024 02:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724034719; cv=none; b=UZVsDQ5F6gaI7OXpi2tuD7NGem3u3HyOf+qgPcxIDbWGFcLKglMsf2NNKtrp4nHG6lMsq/nZ+NUViVvllLplzQ5nJUboHxbzACJZy3A2BZiMVing/8RCfNHIfiWoQSmYRTRHCtePdBgW2fN+5FdI7QY9GRgYlXkQHjLEq0RAgoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724034719; c=relaxed/simple;
	bh=SjyxMmQKra7S5l/6xA9Wu7IUhwn3P+bFS/PXJwp2AHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iczfePo7sjffvx7trwtVdQYx9lMju591DZjm1GywyHLGtfp9mm/4ZkD8Bj0D8L4viKDaNN8xPSElY99ZFmW09OI5scWklf1pGWYyZ2Q2Yk77L6GQdHNq5erYkVpGVKivO+F45sRWaHRpDNG4fgl0zKvSH3HCYs+gzO9XC+nDcmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VoKKLTkP; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e13cce6dc85so1868536276.2;
        Sun, 18 Aug 2024 19:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724034715; x=1724639515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqJ9Y6RR0iCOONporxiAWd0rvcRWYXEUM+u9cAIorwk=;
        b=VoKKLTkPe0etB+fHSLqyt/ByK00wMsISIaBCRtR2wRU5yRL1JCGiYZSQ3GYrORA7gX
         PF19SBmYUG8Nw7xdGWyu2gPvGrFIbsfOlJnQVFYYZY1awDpNRxq5xQQpYVWJpe//8/kg
         OVR3XBJ9of9qhjrYKudu8qSnArbfu2P9q4aUPGXuU1r8eziiuH5vAbnAf6suPfPEzLsI
         03hPFYWvJfde0Wz7EsBQmlGkmLIGv3F3E2U/mdf043JzP2BRldnU6S2H7g4EG6y0esBS
         3LmM7MX/htaHtu1AOlJPk6kZ5/qf17E8XmA4FDrSXUbGrVsX3ACTsrjntmxn2oi3cjir
         KlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724034715; x=1724639515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zqJ9Y6RR0iCOONporxiAWd0rvcRWYXEUM+u9cAIorwk=;
        b=A+P+u1fE+DKquG0Mxbfo2SxoScitgoQGf+UWHOuKP9BDC4F2cB3ScqUBRZ4MR7/MlG
         Jr0xmOURoS+Ltpg7Bciign/BkLYaUJgSJuAVkU+R7usvVWwh8xWG2NTCnWZoavgWdVO4
         vsxp6dti5tASHMqv7vA8jR+157JnVWPl4s7qxYvqGOPLayQS+vWzPe5yZ8hb+k9Jpm3T
         j78ZTMzJGvi/jGVHkI6gcZNx/lDFyjRQEWdJUrSI8R4QjgyDiWfvTldMt3yXi2jwH4lu
         UHckVyaegmhxLXrYJq0aC27xj5fRQISMOiC4GGDGAqfuFhw8Ut5VCZGIchBT/34BRsZA
         t6wQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKsBpb5TaSR2TQHNNiSDiAA45R6LptZd+/w0DkalAr5QwYhI0YWFagoQRe7rhQ7foRQWUXhfRKq/2oBhRZ07sdEne2OuhHwGRW/gFQwd6WstAiAMhuEdt6qDR3+j8lIv0yY0fgOZsT
X-Gm-Message-State: AOJu0Yz9knYt5fwRRUACYEvM1EEH8raHFs5tV6Y10qaByDUvtaP7RvEN
	F8rkD2AtOmQFPJ4FLXruY6KcMYP8Pd4AHliTzuxxRKkecOMCyssY
X-Google-Smtp-Source: AGHT+IGftm6KdS613kRYfd4LezgLxWlUfzFZGyqU4Es+6S/AqWgBVnIYntbuL1qMdd7RJe0UQP4CYA==
X-Received: by 2002:a05:6902:260c:b0:e13:eaf4:884f with SMTP id 3f1490d57ef6-e13eaf4b68emr3300790276.13.1724034714608;
        Sun, 18 Aug 2024 19:31:54 -0700 (PDT)
Received: from localhost (fwdproxy-ash-008.fbsv.net. [2a03:2880:20ff:8::face:b00c])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4536a04e638sm36843281cf.71.2024.08.18.19.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 19:31:53 -0700 (PDT)
From: Usama Arif <usamaarif642@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	roman.gushchin@linux.dev,
	yuzhao@google.com,
	david@redhat.com,
	baohua@kernel.org,
	ryan.roberts@arm.com,
	rppt@kernel.org,
	willy@infradead.org,
	cerasuolodomenico@gmail.com,
	ryncsn@gmail.com,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kernel-team@meta.com,
	Alexander Zhu <alexlzhu@fb.com>,
	Usama Arif <usamaarif642@gmail.com>
Subject: [PATCH v4 3/6] mm: selftest to verify zero-filled pages are mapped to zeropage
Date: Mon, 19 Aug 2024 03:30:56 +0100
Message-ID: <20240819023145.2415299-4-usamaarif642@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20240819023145.2415299-1-usamaarif642@gmail.com>
References: <20240819023145.2415299-1-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Zhu <alexlzhu@fb.com>

When a THP is split, any subpage that is zero-filled will be mapped
to the shared zeropage, hence saving memory. Add selftest to verify
this by allocating zero-filled THP and comparing RssAnon before and
after split.

Signed-off-by: Alexander Zhu <alexlzhu@fb.com>
Acked-by: Rik van Riel <riel@surriel.com>
Signed-off-by: Usama Arif <usamaarif642@gmail.com>
---
 .../selftests/mm/split_huge_page_test.c       | 71 +++++++++++++++++++
 tools/testing/selftests/mm/vm_util.c          | 22 ++++++
 tools/testing/selftests/mm/vm_util.h          |  1 +
 3 files changed, 94 insertions(+)

diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
index e5e8dafc9d94..eb6d1b9fc362 100644
--- a/tools/testing/selftests/mm/split_huge_page_test.c
+++ b/tools/testing/selftests/mm/split_huge_page_test.c
@@ -84,6 +84,76 @@ static void write_debugfs(const char *fmt, ...)
 	write_file(SPLIT_DEBUGFS, input, ret + 1);
 }
 
+static char *allocate_zero_filled_hugepage(size_t len)
+{
+	char *result;
+	size_t i;
+
+	result = memalign(pmd_pagesize, len);
+	if (!result) {
+		printf("Fail to allocate memory\n");
+		exit(EXIT_FAILURE);
+	}
+
+	madvise(result, len, MADV_HUGEPAGE);
+
+	for (i = 0; i < len; i++)
+		result[i] = (char)0;
+
+	return result;
+}
+
+static void verify_rss_anon_split_huge_page_all_zeroes(char *one_page, int nr_hpages, size_t len)
+{
+	unsigned long rss_anon_before, rss_anon_after;
+	size_t i;
+
+	if (!check_huge_anon(one_page, 4, pmd_pagesize)) {
+		printf("No THP is allocated\n");
+		exit(EXIT_FAILURE);
+	}
+
+	rss_anon_before = rss_anon();
+	if (!rss_anon_before) {
+		printf("No RssAnon is allocated before split\n");
+		exit(EXIT_FAILURE);
+	}
+
+	/* split all THPs */
+	write_debugfs(PID_FMT, getpid(), (uint64_t)one_page,
+		      (uint64_t)one_page + len, 0);
+
+	for (i = 0; i < len; i++)
+		if (one_page[i] != (char)0) {
+			printf("%ld byte corrupted\n", i);
+			exit(EXIT_FAILURE);
+		}
+
+	if (!check_huge_anon(one_page, 0, pmd_pagesize)) {
+		printf("Still AnonHugePages not split\n");
+		exit(EXIT_FAILURE);
+	}
+
+	rss_anon_after = rss_anon();
+	if (rss_anon_after >= rss_anon_before) {
+		printf("Incorrect RssAnon value. Before: %ld After: %ld\n",
+		       rss_anon_before, rss_anon_after);
+		exit(EXIT_FAILURE);
+	}
+}
+
+void split_pmd_zero_pages(void)
+{
+	char *one_page;
+	int nr_hpages = 4;
+	size_t len = nr_hpages * pmd_pagesize;
+
+	one_page = allocate_zero_filled_hugepage(len);
+	verify_rss_anon_split_huge_page_all_zeroes(one_page, nr_hpages, len);
+	printf("Split zero filled huge pages successful\n");
+	free(one_page);
+}
+
 void split_pmd_thp(void)
 {
 	char *one_page;
@@ -431,6 +501,7 @@ int main(int argc, char **argv)
 
 	fd_size = 2 * pmd_pagesize;
 
+	split_pmd_zero_pages();
 	split_pmd_thp();
 	split_pte_mapped_thp();
 	split_file_backed_thp();
diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 5a62530da3b5..d8d0cf04bb57 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -12,6 +12,7 @@
 
 #define PMD_SIZE_FILE_PATH "/sys/kernel/mm/transparent_hugepage/hpage_pmd_size"
 #define SMAP_FILE_PATH "/proc/self/smaps"
+#define STATUS_FILE_PATH "/proc/self/status"
 #define MAX_LINE_LENGTH 500
 
 unsigned int __page_size;
@@ -171,6 +172,27 @@ uint64_t read_pmd_pagesize(void)
 	return strtoul(buf, NULL, 10);
 }
 
+unsigned long rss_anon(void)
+{
+	unsigned long rss_anon = 0;
+	FILE *fp;
+	char buffer[MAX_LINE_LENGTH];
+
+	fp = fopen(STATUS_FILE_PATH, "r");
+	if (!fp)
+		ksft_exit_fail_msg("%s: Failed to open file %s\n", __func__, STATUS_FILE_PATH);
+
+	if (!check_for_pattern(fp, "RssAnon:", buffer, sizeof(buffer)))
+		goto err_out;
+
+	if (sscanf(buffer, "RssAnon:%10lu kB", &rss_anon) != 1)
+		ksft_exit_fail_msg("Reading status error\n");
+
+err_out:
+	fclose(fp);
+	return rss_anon;
+}
+
 bool __check_huge(void *addr, char *pattern, int nr_hpages,
 		  uint64_t hpage_size)
 {
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index 9007c420d52c..71b75429f4a5 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -39,6 +39,7 @@ unsigned long pagemap_get_pfn(int fd, char *start);
 void clear_softdirty(void);
 bool check_for_pattern(FILE *fp, const char *pattern, char *buf, size_t len);
 uint64_t read_pmd_pagesize(void);
+uint64_t rss_anon(void);
 bool check_huge_anon(void *addr, int nr_hpages, uint64_t hpage_size);
 bool check_huge_file(void *addr, int nr_hpages, uint64_t hpage_size);
 bool check_huge_shmem(void *addr, int nr_hpages, uint64_t hpage_size);
-- 
2.43.5


