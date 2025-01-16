Return-Path: <linux-doc+bounces-35460-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DC9A13BC1
	for <lists+linux-doc@lfdr.de>; Thu, 16 Jan 2025 15:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22EAF3AA665
	for <lists+linux-doc@lfdr.de>; Thu, 16 Jan 2025 14:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA4322B5AB;
	Thu, 16 Jan 2025 14:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ITY41fSn"
X-Original-To: linux-doc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A4B22ACDF;
	Thu, 16 Jan 2025 14:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737036495; cv=none; b=TSBqF8aNqD1CAfqiPJM/mkRrOQ2rMPqAf+URPj8vvM6ghvCuBHdyD/jukDtDAesWKuEHERAK9u+YboUYMQyyl6JglPpesDl8rfaQAwrHtVLGeNJfMdsIbS+dzaSoHLn9HnAlLslxVb2+n8XgqYSJxQ8sqoeBb3c4c14bEUCknj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737036495; c=relaxed/simple;
	bh=pjVKRaBjxkBBVcSeHbgZyeNf7qBAskW0Z/yRgCPJg3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=THXXwPAYJ/a67HF3tExsD6Or8uxuX5m06cECmC5xOCPDyS1xRRTjM8nCAAQ4/cf3inyNKdL9vv7AWFkVJnYoqknZMyFw/jpm6wBYbfWsWLUIxOq8MfdyURcm+GOdAq4IFvIXejaek2Q6FGq4gjE5kFkZDbbVdc+VWf8PL35AkBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ITY41fSn; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=4UfR+
	rqFWAIiDfImGIrTxypz0j9S0ypMlXklXhXGwWU=; b=ITY41fSnSMF6dlQ4v1Gs8
	VxKlE0lxE5V7r0uR3FGvh3jc2Ze8mZMnlzJUK3CscNPY0wx4hDO6e2k2ENBl7OSC
	9EBYUVBYXaG9kOlEczIEczJLpU3LqVouf2ne0G0ahPpGDTQgGMbulSuAnliHX9Dg
	dSSa3aTDjEZLqlHYyIuiD8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3d5IwEolnR5IwGg--.20972S7;
	Thu, 16 Jan 2025 22:06:40 +0800 (CST)
From: Jiayuan Chen <mrpre@163.com>
To: bpf@vger.kernel.org,
	jakub@cloudflare.com,
	john.fastabend@gmail.com
Cc: netdev@vger.kernel.org,
	martin.lau@linux.dev,
	ast@kernel.org,
	edumazet@google.com,
	davem@davemloft.net,
	dsahern@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org,
	song@kernel.org,
	andrii@kernel.org,
	mhal@rbox.co,
	yonghong.song@linux.dev,
	daniel@iogearbox.net,
	xiyou.wangcong@gmail.com,
	horms@kernel.org,
	corbet@lwn.net,
	eddyz87@gmail.com,
	cong.wang@bytedance.com,
	shuah@kernel.org,
	mykolal@fb.com,
	jolsa@kernel.org,
	haoluo@google.com,
	sdf@fomichev.me,
	kpsingh@kernel.org,
	linux-doc@vger.kernel.org,
	Jiayuan Chen <mrpre@163.com>
Subject: [PATCH bpf v7 5/5] selftests/bpf: add strparser test for bpf
Date: Thu, 16 Jan 2025 22:05:31 +0800
Message-ID: <20250116140531.108636-6-mrpre@163.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250116140531.108636-1-mrpre@163.com>
References: <20250116140531.108636-1-mrpre@163.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3d5IwEolnR5IwGg--.20972S7
X-Coremail-Antispam: 1Uf129KBjvAXoW3Zw1xCw15Zry3Xw18Cw1fXrb_yoW8CF48Co
	Zxuan5X3yxGwnxXrykW34DCw4fWF4xXr4DXr47J3yUuF1jyF42vayUGws3Ww1Skr4Sgryf
	JFWjva4rWr45Ar4fn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4Rc18vDUUUU
X-CM-SenderInfo: xpus2vi6rwjhhfrp/1tbiDwDWp2eJEGsmDAACsD

Add test cases for bpf + strparser and separated them from
sockmap_basic, as strparser has more encapsulation and parsing
capabilities compared to sockmap.

Signed-off-by: Jiayuan Chen <mrpre@163.com>
---
 .../selftests/bpf/prog_tests/sockmap_basic.c  |  53 --
 .../selftests/bpf/prog_tests/sockmap_strp.c   | 452 ++++++++++++++++++
 .../selftests/bpf/progs/test_sockmap_strp.c   |  53 ++
 3 files changed, 505 insertions(+), 53 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/sockmap_strp.c
 create mode 100644 tools/testing/selftests/bpf/progs/test_sockmap_strp.c

diff --git a/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c b/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
index 0c51b7288978..f8953455db29 100644
--- a/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
+++ b/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
@@ -531,57 +531,6 @@ static void test_sockmap_skb_verdict_shutdown(void)
 	test_sockmap_pass_prog__destroy(skel);
 }
 
-static void test_sockmap_stream_pass(void)
-{
-	int zero = 0, sent, recvd;
-	int verdict, parser;
-	int err, map;
-	int c = -1, p = -1;
-	struct test_sockmap_pass_prog *pass = NULL;
-	char snd[256] = "0123456789";
-	char rcv[256] = "0";
-
-	pass = test_sockmap_pass_prog__open_and_load();
-	verdict = bpf_program__fd(pass->progs.prog_skb_verdict);
-	parser = bpf_program__fd(pass->progs.prog_skb_parser);
-	map = bpf_map__fd(pass->maps.sock_map_rx);
-
-	err = bpf_prog_attach(parser, map, BPF_SK_SKB_STREAM_PARSER, 0);
-	if (!ASSERT_OK(err, "bpf_prog_attach stream parser"))
-		goto out;
-
-	err = bpf_prog_attach(verdict, map, BPF_SK_SKB_STREAM_VERDICT, 0);
-	if (!ASSERT_OK(err, "bpf_prog_attach stream verdict"))
-		goto out;
-
-	err = create_pair(AF_INET, SOCK_STREAM, &c, &p);
-	if (err)
-		goto out;
-
-	/* sk_data_ready of 'p' will be replaced by strparser handler */
-	err = bpf_map_update_elem(map, &zero, &p, BPF_NOEXIST);
-	if (!ASSERT_OK(err, "bpf_map_update_elem(p)"))
-		goto out_close;
-
-	/*
-	 * as 'prog_skb_parser' return the original skb len and
-	 * 'prog_skb_verdict' return SK_PASS, the kernel will just
-	 * pass it through to original socket 'p'
-	 */
-	sent = xsend(c, snd, sizeof(snd), 0);
-	ASSERT_EQ(sent, sizeof(snd), "xsend(c)");
-
-	recvd = recv_timeout(p, rcv, sizeof(rcv), SOCK_NONBLOCK,
-			     IO_TIMEOUT_SEC);
-	ASSERT_EQ(recvd, sizeof(rcv), "recv_timeout(p)");
-
-out_close:
-	close(c);
-	close(p);
-
-out:
-	test_sockmap_pass_prog__destroy(pass);
-}
 
 static void test_sockmap_skb_verdict_fionread(bool pass_prog)
 {
@@ -1101,8 +1050,6 @@ void test_sockmap_basic(void)
 		test_sockmap_progs_query(BPF_SK_SKB_VERDICT);
 	if (test__start_subtest("sockmap skb_verdict shutdown"))
 		test_sockmap_skb_verdict_shutdown();
-	if (test__start_subtest("sockmap stream parser and verdict pass"))
-		test_sockmap_stream_pass();
 	if (test__start_subtest("sockmap skb_verdict fionread"))
 		test_sockmap_skb_verdict_fionread(true);
 	if (test__start_subtest("sockmap skb_verdict fionread on drop"))
diff --git a/tools/testing/selftests/bpf/prog_tests/sockmap_strp.c b/tools/testing/selftests/bpf/prog_tests/sockmap_strp.c
new file mode 100644
index 000000000000..01ed1fca1d9c
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/sockmap_strp.c
@@ -0,0 +1,452 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <error.h>
+#include <netinet/tcp.h>
+#include <test_progs.h>
+#include "sockmap_helpers.h"
+#include "test_skmsg_load_helpers.skel.h"
+#include "test_sockmap_strp.skel.h"
+#define STRP_PKT_HEAD_LEN 4
+#define STRP_PKT_BODY_LEN 6
+#define STRP_PKT_FULL_LEN (STRP_PKT_HEAD_LEN + STRP_PKT_BODY_LEN)
+static const char packet[STRP_PKT_FULL_LEN] = "head+body\0";
+static const int test_packet_num = 100;
+
+/* current implementation of tcp_bpf_recvmsg_parser() invoke
+ * data_ready with sk held if skb exist in sk_receive_queue.
+ * Then for data_ready implementation of strparser, it will
+ * delay the read operation if sk was held and EAGAIN is returned.
+ */
+static int sockmap_strp_consume_pre_data(int p)
+{
+	int recvd;
+	bool retried = false;
+	char rcv[10];
+
+retry:
+	errno = 0;
+	recvd = recv_timeout(p, rcv, sizeof(rcv), 0, 1);
+	if (recvd < 0 && errno == EAGAIN && retried == false) {
+		/* On the first call, EAGAIN will certainly be returned.
+		 * Waiting 1 second is pretty enough wait workqueue finish.
+		 */
+		sleep(1);
+		retried = true;
+		goto retry;
+	}
+
+	if (!ASSERT_EQ(recvd, STRP_PKT_FULL_LEN, "recv_timeout(pre-data)") ||
+	    !ASSERT_OK(memcmp(packet, rcv, STRP_PKT_FULL_LEN),
+				"memcmp pre-data"))
+		return -1;
+	return 0;
+}
+
+static struct test_sockmap_strp *sockmap_strp_init(int *out_map, bool pass,
+						   bool need_parser)
+{
+	struct test_sockmap_strp *strp = NULL;
+	int verdict, parser;
+	int err;
+
+	strp = test_sockmap_strp__open_and_load();
+	*out_map = bpf_map__fd(strp->maps.sock_map);
+
+	if (need_parser)
+		parser = bpf_program__fd(strp->progs.prog_skb_parser_partial);
+	else
+		parser = bpf_program__fd(strp->progs.prog_skb_parser);
+
+	if (pass)
+		verdict = bpf_program__fd(strp->progs.prog_skb_verdict_pass);
+	else
+		verdict = bpf_program__fd(strp->progs.prog_skb_verdict);
+
+	err = bpf_prog_attach(parser, *out_map, BPF_SK_SKB_STREAM_PARSER, 0);
+	if (!ASSERT_OK(err, "bpf_prog_attach stream parser"))
+		goto err;
+
+	err = bpf_prog_attach(verdict, *out_map, BPF_SK_SKB_STREAM_VERDICT, 0);
+	if (!ASSERT_OK(err, "bpf_prog_attach stream verdict"))
+		goto err;
+
+	return strp;
+err:
+	test_sockmap_strp__destroy(strp);
+	return NULL;
+}
+
+/* Dispatch packets to different socket by packet size:
+ *
+ *                      ------  ------
+ *                     | pkt4 || pkt1 |... > remote socket
+ *  ------ ------     / ------  ------
+ * | pkt8 | pkt7 |...
+ *  ------ ------     \ ------  ------
+ *                     | pkt3 || pkt2 |... > local socket
+ *                      ------  ------
+ */
+static void test_sockmap_strp_dispatch_pkt(int family, int sotype)
+{
+	int i, j, zero = 0, one = 1, recvd;
+	int err, map;
+	int c0 = -1, p0 = -1, c1 = -1, p1 = -1;
+	struct test_sockmap_strp *strp = NULL;
+	int test_cnt = 6;
+	char rcv[10];
+	struct {
+		char	data[7];
+		int	data_len;
+		int	send_cnt;
+		int	*receiver;
+	} send_dir[2] = {
+		/* data expected to deliver to local */
+		{"llllll", 6, 0, &p0},
+		/* data expected to deliver to remote */
+		{"rrrrr",  5, 0, &c1}
+	};
+
+	strp = sockmap_strp_init(&map, false, false);
+	if (!ASSERT_TRUE(strp, "sockmap_strp_init"))
+		return;
+
+	err = create_socket_pairs(family, sotype, &c0, &c1, &p0, &p1);
+	if (!ASSERT_OK(err, "create_socket_pairs()"))
+		goto out;
+
+	err = bpf_map_update_elem(map, &zero, &p0, BPF_NOEXIST);
+	if (!ASSERT_OK(err, "bpf_map_update_elem(p0)"))
+		goto out_close;
+
+	err = bpf_map_update_elem(map, &one, &p1, BPF_NOEXIST);
+	if (!ASSERT_OK(err, "bpf_map_update_elem(p1)"))
+		goto out_close;
+
+	err = setsockopt(c1, IPPROTO_TCP, TCP_NODELAY, &zero, sizeof(zero));
+	if (!ASSERT_OK(err, "setsockopt(TCP_NODELAY)"))
+		goto out_close;
+
+	/* deliver data with data size greater than 5 to local */
+	strp->data->verdict_max_size = 5;
+
+	for (i = 0; i < test_cnt; i++) {
+		int d = i % 2;
+
+		xsend(c0, send_dir[d].data, send_dir[d].data_len, 0);
+		send_dir[d].send_cnt++;
+	}
+
+	for (i = 0; i < 2; i++) {
+		for (j = 0; j < send_dir[i].send_cnt; j++) {
+			int expected = send_dir[i].data_len;
+
+			recvd = recv_timeout(*send_dir[i].receiver, rcv,
+					     expected, MSG_DONTWAIT,
+					     IO_TIMEOUT_SEC);
+			if (!ASSERT_EQ(recvd, expected, "recv_timeout()"))
+				goto out_close;
+			if (!ASSERT_OK(memcmp(send_dir[i].data, rcv, recvd),
+				       "memcmp(rcv)"))
+				goto out_close;
+		}
+	}
+out_close:
+	close(c0);
+	close(c1);
+	close(p0);
+	close(p1);
+out:
+	test_sockmap_strp__destroy(strp);
+}
+
+/* We have multiple packets in one skb
+ * ------------ ------------ ------------
+ * |  packet1  |   packet2  |  ...
+ * ------------ ------------ ------------
+ */
+static void test_sockmap_strp_multiple_pkt(int family, int sotype)
+{
+	int i, zero = 0;
+	int sent, recvd, total;
+	int err, map;
+	int c = -1, p = -1;
+	struct test_sockmap_strp *strp = NULL;
+	char *snd = NULL, *rcv = NULL;
+
+	strp = sockmap_strp_init(&map, true, true);
+	if (!ASSERT_TRUE(strp, "sockmap_strp_init"))
+		return;
+
+	err = create_pair(family, sotype, &c, &p);
+	if (err)
+		goto out;
+
+	err = bpf_map_update_elem(map, &zero, &p, BPF_NOEXIST);
+	if (!ASSERT_OK(err, "bpf_map_update_elem(zero, p)"))
+		goto out_close;
+
+	/* construct multiple packets in one buffer */
+	total = test_packet_num * STRP_PKT_FULL_LEN;
+	snd = malloc(total);
+	rcv = malloc(total + 1);
+	if (!ASSERT_TRUE(snd, "malloc(snd)") ||
+	    !ASSERT_TRUE(rcv, "malloc(rcv)"))
+		goto out_close;
+
+	for (i = 0; i < test_packet_num; i++) {
+		memcpy(snd + i * STRP_PKT_FULL_LEN,
+		       packet, STRP_PKT_FULL_LEN);
+	}
+
+	sent = xsend(c, snd, total, 0);
+	if (!ASSERT_EQ(sent, total, "xsend(c)"))
+		goto out_close;
+
+	/* try to recv one more byte to avoid truncation check */
+	recvd = recv_timeout(p, rcv, total + 1, MSG_DONTWAIT, IO_TIMEOUT_SEC);
+	if (!ASSERT_EQ(recvd, total, "recv(rcv)"))
+		goto out_close;
+
+	/* we sent TCP segment with multiple encapsulation
+	 * then check whether packets are handled correctly
+	 */
+	if (!ASSERT_OK(memcmp(snd, rcv, total), "memcmp(snd, rcv)"))
+		goto out_close;
+
+out_close:
+	close(c);
+	close(p);
+	if (snd)
+		free(snd);
+	if (rcv)
+		free(rcv);
+out:
+	test_sockmap_strp__destroy(strp);
+}
+
+/* Test strparser with partial read */
+static void test_sockmap_strp_partial_read(int family, int sotype)
+{
+	int zero = 0, recvd, off;
+	int err, map;
+	int c = -1, p = -1;
+	struct test_sockmap_strp *strp = NULL;
+	char rcv[STRP_PKT_FULL_LEN + 1] = "0";
+
+	strp = sockmap_strp_init(&map, true, true);
+	if (!ASSERT_TRUE(strp, "sockmap_strp_init"))
+		return;
+
+	err = create_pair(family, sotype, &c, &p);
+	if (err)
+		goto out;
+
+	/* sk_data_ready of 'p' will be replaced by strparser handler */
+	err = bpf_map_update_elem(map, &zero, &p, BPF_NOEXIST);
+	if (!ASSERT_OK(err, "bpf_map_update_elem(zero, p)"))
+		goto out_close;
+
+	/* 1.1 send partial head, 1 byte header left*/
+	off = STRP_PKT_HEAD_LEN - 1;
+	xsend(c, packet, off, 0);
+	recvd = recv_timeout(p, rcv, sizeof(rcv), MSG_DONTWAIT, 1);
+	if (!ASSERT_EQ(-1, recvd, "insufficient head, should no data recvd"))
+		goto out_close;
+
+	/* 1.2 send remaining head and body */
+	xsend(c, packet + off, STRP_PKT_FULL_LEN - off, 0);
+	recvd = recv_timeout(p, rcv, sizeof(rcv), MSG_DONTWAIT, IO_TIMEOUT_SEC);
+	if (!ASSERT_EQ(recvd, STRP_PKT_FULL_LEN, "should full data recvd"))
+		goto out_close;
+
+	/* 2.1 send partial head, 1 byte header left */
+	off = STRP_PKT_HEAD_LEN - 1;
+	xsend(c, packet, off, 0);
+
+	/* 2.2 send remaining head and partial body, 1 byte body left */
+	xsend(c, packet + off, STRP_PKT_FULL_LEN - off - 1, 0);
+	off = STRP_PKT_FULL_LEN - 1;
+	recvd = recv_timeout(p, rcv, sizeof(rcv), MSG_DONTWAIT, 1);
+	if (!ASSERT_EQ(-1, recvd, "insufficient body, should no data read"))
+		goto out_close;
+
+	/* 2.3 send remaining body */
+	xsend(c, packet + off, STRP_PKT_FULL_LEN - off, 0);
+	recvd = recv_timeout(p, rcv, sizeof(rcv), MSG_DONTWAIT, IO_TIMEOUT_SEC);
+	if (!ASSERT_EQ(recvd, STRP_PKT_FULL_LEN, "should full data recvd"))
+		goto out_close;
+
+out_close:
+	close(c);
+	close(p);
+
+out:
+	test_sockmap_strp__destroy(strp);
+}
+
+/* Test simple socket read/write with strparser + FIONREAD */
+static void test_sockmap_strp_pass(int family, int sotype, bool fionread)
+{
+	int zero = 0, pkt_size = STRP_PKT_FULL_LEN, sent, recvd, avail;
+	int err, map;
+	int c = -1, p = -1;
+	int test_cnt = 10, i;
+	struct test_sockmap_strp *strp = NULL;
+	char rcv[STRP_PKT_FULL_LEN + 1] = "0";
+
+	strp = sockmap_strp_init(&map, true, true);
+	if (!ASSERT_TRUE(strp, "sockmap_strp_init"))
+		return;
+
+	err = create_pair(family, sotype, &c, &p);
+	if (err)
+		goto out;
+
+	/* inject some data before bpf process, it should be read
+	 * correctly because we check sk_receive_queue in
+	 * tcp_bpf_recvmsg_parser()
+	 */
+	sent = xsend(c, packet, pkt_size, 0);
+	if (!ASSERT_EQ(sent, pkt_size, "xsend(pre-data)"))
+		goto out_close;
+
+	/* sk_data_ready of 'p' will be replaced by strparser handler */
+	err = bpf_map_update_elem(map, &zero, &p, BPF_NOEXIST);
+	if (!ASSERT_OK(err, "bpf_map_update_elem(p)"))
+		goto out_close;
+
+	/* consume previous data we injected */
+	if (sockmap_strp_consume_pre_data(p))
+		goto out_close;
+
+	/* Previously, we encountered issues such as deadlocks and
+	 * sequence errors that resulted in the inability to read
+	 * continuously. Therefore, we perform multiple iterations
+	 * of testing here.
+	 */
+	for (i = 0; i < test_cnt; i++) {
+		sent = xsend(c, packet, pkt_size, 0);
+		if (!ASSERT_EQ(sent, pkt_size, "xsend(c)"))
+			goto out_close;
+
+		recvd = recv_timeout(p, rcv, sizeof(rcv), MSG_DONTWAIT,
+				     IO_TIMEOUT_SEC);
+		if (!ASSERT_EQ(recvd, pkt_size, "recv_timeout(p)") ||
+		    !ASSERT_OK(memcmp(packet, rcv, pkt_size),
+				  "memcmp"))
+			goto out_close;
+	}
+
+	if (fionread) {
+		sent = xsend(c, packet, pkt_size, 0);
+		if (!ASSERT_EQ(sent, pkt_size, "second xsend(c)"))
+			goto out_close;
+
+		err = ioctl(p, FIONREAD, &avail);
+		if (!ASSERT_OK(err, "ioctl(FIONREAD) error") ||
+		    !ASSERT_EQ(avail, pkt_size, "ioctl(FIONREAD)"))
+			goto out_close;
+
+		recvd = recv_timeout(p, rcv, sizeof(rcv), MSG_DONTWAIT,
+				     IO_TIMEOUT_SEC);
+		if (!ASSERT_EQ(recvd, pkt_size, "second recv_timeout(p)") ||
+		    !ASSERT_OK(memcmp(packet, rcv, pkt_size),
+			      "second memcmp"))
+			goto out_close;
+	}
+
+out_close:
+	close(c);
+	close(p);
+
+out:
+	test_sockmap_strp__destroy(strp);
+}
+
+/* Test strparser with verdict mode */
+static void test_sockmap_strp_verdict(int family, int sotype)
+{
+	int zero = 0, one = 1, sent, recvd, off;
+	int err, map;
+	int c0 = -1, p0 = -1, c1 = -1, p1 = -1;
+	struct test_sockmap_strp *strp = NULL;
+	char rcv[STRP_PKT_FULL_LEN + 1] = "0";
+
+	strp = sockmap_strp_init(&map, false, true);
+	if (!ASSERT_TRUE(strp, "sockmap_strp_init"))
+		return;
+
+	/* We simulate a reverse proxy server.
+	 * When p0 receives data from c0, we forward it to c1.
+	 * From c1's perspective, it will consider this data
+	 * as being sent by p1.
+	 */
+	err = create_socket_pairs(family, sotype, &c0, &c1, &p0, &p1);
+	if (!ASSERT_OK(err, "create_socket_pairs()"))
+		goto out;
+
+	err = bpf_map_update_elem(map, &zero, &p0, BPF_NOEXIST);
+	if (!ASSERT_OK(err, "bpf_map_update_elem(p0)"))
+		goto out_close;
+
+	err = bpf_map_update_elem(map, &one, &p1, BPF_NOEXIST);
+	if (!ASSERT_OK(err, "bpf_map_update_elem(c1)"))
+		goto out_close;
+
+	sent = xsend(c0, packet, STRP_PKT_FULL_LEN, 0);
+	if (!ASSERT_EQ(sent, STRP_PKT_FULL_LEN, "xsend(c0)"))
+		goto out_close;
+
+	recvd = recv_timeout(c1, rcv, sizeof(rcv), MSG_DONTWAIT,
+			     IO_TIMEOUT_SEC);
+	if (!ASSERT_EQ(recvd, STRP_PKT_FULL_LEN, "recv_timeout(p1)") ||
+	    !ASSERT_OK(memcmp(packet, rcv, STRP_PKT_FULL_LEN),
+			  "received data does not match the sent data"))
+		goto out_close;
+
+	/* send again to ensure the stream is functioning correctly. */
+	sent = xsend(c0, packet, STRP_PKT_FULL_LEN, 0);
+	if (!ASSERT_EQ(sent, STRP_PKT_FULL_LEN, "second xsend(c0)"))
+		goto out_close;
+
+	/* partial read */
+	off = STRP_PKT_FULL_LEN / 2;
+	recvd = recv_timeout(c1, rcv, off, MSG_DONTWAIT,
+			     IO_TIMEOUT_SEC);
+	recvd += recv_timeout(c1, rcv + off, sizeof(rcv) - off, MSG_DONTWAIT,
+			      IO_TIMEOUT_SEC);
+
+	if (!ASSERT_EQ(recvd, STRP_PKT_FULL_LEN, "partial recv_timeout(c1)") ||
+	    !ASSERT_OK(memcmp(packet, rcv, STRP_PKT_FULL_LEN),
+			  "partial received data does not match the sent data"))
+		goto out_close;
+
+out_close:
+	close(c0);
+	close(c1);
+	close(p0);
+	close(p1);
+out:
+	test_sockmap_strp__destroy(strp);
+}
+
+void test_sockmap_strp(void)
+{
+	if (test__start_subtest("sockmap strp tcp pass"))
+		test_sockmap_strp_pass(AF_INET, SOCK_STREAM, false);
+	if (test__start_subtest("sockmap strp tcp v6 pass"))
+		test_sockmap_strp_pass(AF_INET6, SOCK_STREAM, false);
+	if (test__start_subtest("sockmap strp tcp pass fionread"))
+		test_sockmap_strp_pass(AF_INET, SOCK_STREAM, true);
+	if (test__start_subtest("sockmap strp tcp v6 pass fionread"))
+		test_sockmap_strp_pass(AF_INET6, SOCK_STREAM, true);
+	if (test__start_subtest("sockmap strp tcp verdict"))
+		test_sockmap_strp_verdict(AF_INET, SOCK_STREAM);
+	if (test__start_subtest("sockmap strp tcp v6 verdict"))
+		test_sockmap_strp_verdict(AF_INET6, SOCK_STREAM);
+	if (test__start_subtest("sockmap strp tcp partial read"))
+		test_sockmap_strp_partial_read(AF_INET, SOCK_STREAM);
+	if (test__start_subtest("sockmap strp tcp multiple packets"))
+		test_sockmap_strp_multiple_pkt(AF_INET, SOCK_STREAM);
+	if (test__start_subtest("sockmap strp tcp dispatch"))
+		test_sockmap_strp_dispatch_pkt(AF_INET, SOCK_STREAM);
+}
diff --git a/tools/testing/selftests/bpf/progs/test_sockmap_strp.c b/tools/testing/selftests/bpf/progs/test_sockmap_strp.c
new file mode 100644
index 000000000000..dde3d5bec515
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/test_sockmap_strp.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/bpf.h>
+#include <bpf/bpf_helpers.h>
+#include <bpf/bpf_endian.h>
+int verdict_max_size = 10000;
+struct {
+	__uint(type, BPF_MAP_TYPE_SOCKMAP);
+	__uint(max_entries, 20);
+	__type(key, int);
+	__type(value, int);
+} sock_map SEC(".maps");
+
+SEC("sk_skb/stream_verdict")
+int prog_skb_verdict(struct __sk_buff *skb)
+{
+	__u32 one = 1;
+
+	if (skb->len > verdict_max_size)
+		return SK_PASS;
+
+	return bpf_sk_redirect_map(skb, &sock_map, one, 0);
+}
+
+SEC("sk_skb/stream_verdict")
+int prog_skb_verdict_pass(struct __sk_buff *skb)
+{
+	return SK_PASS;
+}
+
+SEC("sk_skb/stream_parser")
+int prog_skb_parser(struct __sk_buff *skb)
+{
+	return skb->len;
+}
+
+SEC("sk_skb/stream_parser")
+int prog_skb_parser_partial(struct __sk_buff *skb)
+{
+	/* agreement with the test program on a 4-byte size header
+	 * and 6-byte body.
+	 */
+	if (skb->len < 4) {
+		/* need more header to determine full length */
+		return 0;
+	}
+	/* return full length decoded from header.
+	 * the return value may be larger than skb->len which
+	 * means framework must wait body coming.
+	 */
+	return 10;
+}
+
+char _license[] SEC("license") = "GPL";
-- 
2.43.5


