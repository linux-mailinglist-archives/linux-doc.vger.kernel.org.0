Return-Path: <linux-doc+bounces-16552-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDA28C9649
	for <lists+linux-doc@lfdr.de>; Sun, 19 May 2024 22:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E0F328109C
	for <lists+linux-doc@lfdr.de>; Sun, 19 May 2024 20:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE1A74E26;
	Sun, 19 May 2024 20:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeweavers.com header.i=@codeweavers.com header.b="M/gQDnld"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.codeweavers.com (mail.codeweavers.com [4.36.192.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6136E605;
	Sun, 19 May 2024 20:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=4.36.192.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716150318; cv=none; b=SIpFkn97/dFTwDXqTUjA/qkau9k1hQ2pFT242UL23GT2qR9XJMP992exOBpS7Kf1VfYKC3DVuTjGD2WcnDbOnKT1Ma6HNLEux06AHHLL7ug61YGUXayEL249cOBn4pIWZkXoBOyZN42SceYYTxF5oD87P4GqzQ+8IUPYDjWi/mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716150318; c=relaxed/simple;
	bh=L8d9LKUtIlHbbP7cxUNXa7f8ALBrZ7EKpjsLi7r052M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rfx/vW3FsL/LWdP+JlTrKP6eqd5lhBdayfEDnURTvolVzRliZ5K2gd7DvfO0neKeClWULGXxIAqhCPaxm+wZoKaxh2S8AGPgLJ9vn6ZN17Vgfl03CxQKsQSc3CbhOIMYLbMkCh8kanKHDiKemIKuR417FyjkWR40LWdupOtq6yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeweavers.com; spf=pass smtp.mailfrom=codeweavers.com; dkim=pass (2048-bit key) header.d=codeweavers.com header.i=@codeweavers.com header.b=M/gQDnld; arc=none smtp.client-ip=4.36.192.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeweavers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeweavers.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codeweavers.com; s=s1; h=Message-ID:Date:Subject:Cc:To:From:Sender;
	bh=Y95uioGAPMdZZ0cAwPbXEkD4hHbWG+8pblZmeRY+GjA=; b=M/gQDnld0AO8vpSDUgQbfm3GJW
	S4q/YIrYp4zjW4snBGhZA43oAIxaIiHV+2geyiROiOVeI7VwiJVw4A7C+vk8uNhCYEBfxeEJFUrbO
	2wuiIbEVXZc8hAICst9f0T1d+cf583JSdJTz543gJLOoStD2Ez6GA39fbX6eKLp1v8MLp8U7v6MLn
	5djtCABzh9vqU4FYpoQNNCuQW2ElqT235KlAbHbOYQw24C+xSWC/EBnk2WQhw58crf1jt2aEESeVn
	QtcNgfqHsr1oP2X2mFNMU8N849KZ0vnT7ntevypiqXZY54wawci4LE6vRGzTov+JZ19YHoWYSUqSE
	snDHtzTA==;
Received: from cw137ip160.mn.codeweavers.com ([10.69.137.160] helo=camazotz.mn.codeweavers.com)
	by mail.codeweavers.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <zfigura@codeweavers.com>)
	id 1s8n5e-008wIn-2E;
	Sun, 19 May 2024 15:25:06 -0500
From: Elizabeth Figura <zfigura@codeweavers.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org,
	wine-devel@winehq.org,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Wolfram Sang <wsa@kernel.org>,
	Arkadiusz Hiler <ahiler@codeweavers.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Elizabeth Figura <zfigura@codeweavers.com>
Subject: [PATCH v5 20/28] selftests: ntsync: Add some tests for manual-reset event state.
Date: Sun, 19 May 2024 15:24:46 -0500
Message-ID: <20240519202454.1192826-21-zfigura@codeweavers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240519202454.1192826-1-zfigura@codeweavers.com>
References: <20240519202454.1192826-1-zfigura@codeweavers.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Test event-specific ioctls NTSYNC_IOC_EVENT_SET, NTSYNC_IOC_EVENT_RESET,
NTSYNC_IOC_EVENT_PULSE, NTSYNC_IOC_EVENT_READ for manual-reset events, and
waiting on manual-reset events.

Signed-off-by: Elizabeth Figura <zfigura@codeweavers.com>
---
 .../testing/selftests/drivers/ntsync/ntsync.c | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/tools/testing/selftests/drivers/ntsync/ntsync.c b/tools/testing/selftests/drivers/ntsync/ntsync.c
index b77fb0b2c4b1..b6481c2b85cc 100644
--- a/tools/testing/selftests/drivers/ntsync/ntsync.c
+++ b/tools/testing/selftests/drivers/ntsync/ntsync.c
@@ -73,6 +73,27 @@ static int unlock_mutex(int mutex, __u32 owner, __u32 *count)
 	return ret;
 }
 
+static int read_event_state(int event, __u32 *signaled, __u32 *manual)
+{
+	struct ntsync_event_args args;
+	int ret;
+
+	memset(&args, 0xcc, sizeof(args));
+	ret = ioctl(event, NTSYNC_IOC_EVENT_READ, &args);
+	*signaled = args.signaled;
+	*manual = args.manual;
+	return ret;
+}
+
+#define check_event_state(event, signaled, manual) \
+	({ \
+		__u32 __signaled, __manual; \
+		int ret = read_event_state((event), &__signaled, &__manual); \
+		EXPECT_EQ(0, ret); \
+		EXPECT_EQ((signaled), __signaled); \
+		EXPECT_EQ((manual), __manual); \
+	})
+
 static int wait_objs(int fd, unsigned long request, __u32 count,
 		     const int *objs, __u32 owner, __u32 *index)
 {
@@ -353,6 +374,74 @@ TEST(mutex_state)
 	close(fd);
 }
 
+TEST(manual_event_state)
+{
+	struct ntsync_event_args event_args;
+	__u32 index, signaled;
+	int fd, event, ret;
+
+	fd = open("/dev/ntsync", O_CLOEXEC | O_RDONLY);
+	ASSERT_LE(0, fd);
+
+	event_args.manual = 1;
+	event_args.signaled = 0;
+	event_args.event = 0xdeadbeef;
+	ret = ioctl(fd, NTSYNC_IOC_CREATE_EVENT, &event_args);
+	EXPECT_EQ(0, ret);
+	EXPECT_NE(0xdeadbeef, event_args.event);
+	event = event_args.event;
+	check_event_state(event, 0, 1);
+
+	signaled = 0xdeadbeef;
+	ret = ioctl(event, NTSYNC_IOC_EVENT_SET, &signaled);
+	EXPECT_EQ(0, ret);
+	EXPECT_EQ(0, signaled);
+	check_event_state(event, 1, 1);
+
+	ret = ioctl(event, NTSYNC_IOC_EVENT_SET, &signaled);
+	EXPECT_EQ(0, ret);
+	EXPECT_EQ(1, signaled);
+	check_event_state(event, 1, 1);
+
+	ret = wait_any(fd, 1, &event, 123, &index);
+	EXPECT_EQ(0, ret);
+	EXPECT_EQ(0, index);
+	check_event_state(event, 1, 1);
+
+	signaled = 0xdeadbeef;
+	ret = ioctl(event, NTSYNC_IOC_EVENT_RESET, &signaled);
+	EXPECT_EQ(0, ret);
+	EXPECT_EQ(1, signaled);
+	check_event_state(event, 0, 1);
+
+	ret = ioctl(event, NTSYNC_IOC_EVENT_RESET, &signaled);
+	EXPECT_EQ(0, ret);
+	EXPECT_EQ(0, signaled);
+	check_event_state(event, 0, 1);
+
+	ret = wait_any(fd, 1, &event, 123, &index);
+	EXPECT_EQ(-1, ret);
+	EXPECT_EQ(ETIMEDOUT, errno);
+
+	ret = ioctl(event, NTSYNC_IOC_EVENT_SET, &signaled);
+	EXPECT_EQ(0, ret);
+	EXPECT_EQ(0, signaled);
+
+	ret = ioctl(event, NTSYNC_IOC_EVENT_PULSE, &signaled);
+	EXPECT_EQ(0, ret);
+	EXPECT_EQ(1, signaled);
+	check_event_state(event, 0, 1);
+
+	ret = ioctl(event, NTSYNC_IOC_EVENT_PULSE, &signaled);
+	EXPECT_EQ(0, ret);
+	EXPECT_EQ(0, signaled);
+	check_event_state(event, 0, 1);
+
+	close(event);
+
+	close(fd);
+}
+
 TEST(test_wait_any)
 {
 	int objs[NTSYNC_MAX_WAIT_COUNT + 1], fd, ret;
-- 
2.43.0


