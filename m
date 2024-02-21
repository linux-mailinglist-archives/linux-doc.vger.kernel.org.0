Return-Path: <linux-doc+bounces-10228-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE1B85E354
	for <lists+linux-doc@lfdr.de>; Wed, 21 Feb 2024 17:29:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73355287A2A
	for <lists+linux-doc@lfdr.de>; Wed, 21 Feb 2024 16:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9080385C77;
	Wed, 21 Feb 2024 16:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jvPtQ9yi"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612A182D77;
	Wed, 21 Feb 2024 16:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708532791; cv=none; b=RE1I8DxTseXsP/bQVGeTICsxqcAqJKPtEF3AkUA+5R+QI+A3JoFHrAQ32qLO1eQT5XXhTgPBVJP8OMijmeekqy5YJJuKWPVDGr93w8FoxJNyxQssgy9CQCgNrMkpRkCSHDhx0V7XHO+YwJtsCgv43hB2SJa5RjJ/C5ZVFYGDCDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708532791; c=relaxed/simple;
	bh=uFqa1SLCaUViBoH/OYHQ0iYiqRPFBCZ/HsiN0L6yk2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MbIb0c0+JdTwisa6ridjGodRGIGF+6WCYJjoEKxP8NHjslGUElbaTPb4wIko8aaoUJ26LQ0NiggwFKe/Vk/d7pcvrMDDelANcn8i0bHRJepznuv7LfIBFW+3dFSLzGpgTVLhm9nSSse1t9HsATBwCpBaJC+ZYduuePRQCyTnOBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jvPtQ9yi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA99EC43390;
	Wed, 21 Feb 2024 16:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708532791;
	bh=uFqa1SLCaUViBoH/OYHQ0iYiqRPFBCZ/HsiN0L6yk2I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jvPtQ9yihE49v9Ew2xh8ToPyc0J3cU08IGWFxiG/ShjpNq0IAxlXPBm6dEdcMWaTL
	 UcK6NNUytrAwC0X5YcsuowlOPfVWTf9x0ivdf4q/OrUqh6nk8OyhMwTP4utovKeGrT
	 AOfpMI1NusxYGDCAA7Vin4TGHVrdkbv17T3rV5hO2qF/QNAGmls3Js58qEzMb5avHT
	 ydNJk2VHsRR322Fs3NOukc6wrPeMvLI8Q/5djTwGs3Q5CuaWq/QfRPN4n/xQU9woMM
	 JrKw3Q02vrpuVtA/DHDU6NKvsI8SoXMhFzwic+J5WAoKZruNoYvVfB4bq6bnM3QRaZ
	 +fsS9sdGUsbOQ==
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Wed, 21 Feb 2024 17:25:31 +0100
Subject: [PATCH RFC bpf-next v3 15/16] selftests/hid: add test for
 bpf_timer
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-hid-bpf-sleepable-v3-15-1fb378ca6301@kernel.org>
References: <20240221-hid-bpf-sleepable-v3-0-1fb378ca6301@kernel.org>
In-Reply-To: <20240221-hid-bpf-sleepable-v3-0-1fb378ca6301@kernel.org>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708532719; l=8253;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=uFqa1SLCaUViBoH/OYHQ0iYiqRPFBCZ/HsiN0L6yk2I=;
 b=YZnsdAt39+fJdwZpL7xIMeZqz3RIqrOxdy/X4PpDsrYWgIcjWRBvXTozHTdzNsiuNiepZidlv
 2LjSk1qtpVCCUel10ER3sTxlTX51sN0AhAJISIB5YscPOTVBQyPCNX4
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

This test checks that we can actually delay a workload in a sleepable
context through bpf_timer.

When an event is injected, we push it on a map of type queue and schedule
a work.
When that work kicks in, it pulls the event from the queue, and wakes
up userspace through a ring buffer.

The use of the ring buffer is there to not have sleeps in userspace
because we have no guarantees of the timing of when those jobs will be
called.

Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>

---

changes in v3:
- amended for the new API changes in v3

new in v2
---
 tools/testing/selftests/hid/hid_bpf.c              |  83 +++++++++++
 tools/testing/selftests/hid/progs/hid.c            | 152 +++++++++++++++++++++
 .../testing/selftests/hid/progs/hid_bpf_helpers.h  |   2 +
 3 files changed, 237 insertions(+)

diff --git a/tools/testing/selftests/hid/hid_bpf.c b/tools/testing/selftests/hid/hid_bpf.c
index f825623e3edc..c16efb43dd91 100644
--- a/tools/testing/selftests/hid/hid_bpf.c
+++ b/tools/testing/selftests/hid/hid_bpf.c
@@ -875,6 +875,89 @@ TEST_F(hid_bpf, test_hid_user_raw_request_call)
 	ASSERT_EQ(args.data[1], 2);
 }
 
+static __u8 workload_data;
+
+static int handle_event(void *ctx, void *data, size_t data_sz)
+{
+	const __u8 *e = data;
+
+	workload_data = *e;
+
+	return 0;
+}
+
+TEST_F(hid_bpf, test_hid_schedule_work_defer_events_2)
+{
+	struct hid_hw_request_syscall_args args = {
+		.retval = -1,
+		.size = 10,
+	};
+	DECLARE_LIBBPF_OPTS(bpf_test_run_opts, tattrs,
+			    .ctx_in = &args,
+			    .ctx_size_in = sizeof(args),
+	);
+	const struct test_program progs[] = {
+		{ .name = "hid_defer_bpf_timer" },
+	};
+	struct ring_buffer *rb = NULL;
+	__u8 buf[10] = {0};
+	int prog_fd, err;
+
+	LOAD_PROGRAMS(progs);
+
+	/* Set up ring buffer polling */
+	rb = ring_buffer__new(bpf_map__fd(self->skel->maps.rb), handle_event, NULL, NULL);
+	ASSERT_OK_PTR(rb) TH_LOG("Failed to create ring buffer");
+	ASSERT_EQ(workload_data, 0);
+
+	args.hid = self->hid_id;
+	prog_fd = bpf_program__fd(self->skel->progs.hid_setup_timer);
+
+	err = bpf_prog_test_run_opts(prog_fd, &tattrs);
+
+	ASSERT_OK(err) TH_LOG("error while calling bpf_prog_test_run_opts");
+
+	/* check that there is no data to read from hidraw */
+	memset(buf, 0, sizeof(buf));
+	err = read(self->hidraw_fd, buf, sizeof(buf));
+	ASSERT_EQ(err, -1) TH_LOG("read_hidraw");
+
+	/* inject one event */
+	buf[0] = 1;
+	buf[1] = 47;
+	buf[2] = 50;
+	uhid_send_event(_metadata, self->uhid_fd, buf, 6);
+
+	err = ring_buffer__poll(rb, 100 /* timeout, ms */);
+	ASSERT_EQ(err, 1) TH_LOG("error while calling ring_buffer__poll");
+	ASSERT_EQ(workload_data, 3);
+
+	/* read the data from hidraw */
+	memset(buf, 0, sizeof(buf));
+	err = read(self->hidraw_fd, buf, sizeof(buf));
+	ASSERT_EQ(err, 6) TH_LOG("read_hidraw");
+	ASSERT_EQ(buf[0], 2);
+	ASSERT_EQ(buf[1], 3);
+	ASSERT_EQ(buf[2], 4) TH_LOG("leftovers_from_previous_test");
+
+	err = ring_buffer__poll(rb, 100 /* timeout, ms */);
+	ASSERT_EQ(err, 1) TH_LOG("error while calling ring_buffer__poll");
+	ASSERT_EQ(workload_data, 4);
+
+	/* read the data from hidraw */
+	memset(buf, 0, sizeof(buf));
+	err = read(self->hidraw_fd, buf, sizeof(buf));
+	ASSERT_EQ(err, 6) TH_LOG("read_hidraw");
+	ASSERT_EQ(buf[0], 2);
+	ASSERT_EQ(buf[1], 4);
+	ASSERT_EQ(buf[2], 6);
+
+	/* read the data from hidraw */
+	memset(buf, 0, sizeof(buf));
+	err = read(self->hidraw_fd, buf, sizeof(buf));
+	ASSERT_EQ(err, -1) TH_LOG("read_hidraw");
+}
+
 /*
  * Attach hid_insert{0,1,2} to the given uhid device,
  * retrieve and open the matching hidraw node,
diff --git a/tools/testing/selftests/hid/progs/hid.c b/tools/testing/selftests/hid/progs/hid.c
index f67d35def142..7afcc77bcc29 100644
--- a/tools/testing/selftests/hid/progs/hid.c
+++ b/tools/testing/selftests/hid/progs/hid.c
@@ -250,3 +250,155 @@ int BPF_PROG(hid_test_insert3, struct hid_bpf_ctx *hid_ctx)
 
 	return 0;
 }
+
+struct test_report {
+	__u8 data[6];
+};
+
+struct {
+	__uint(type, BPF_MAP_TYPE_QUEUE);
+	__uint(max_entries, 8);
+	__type(value, struct test_report);
+} queue SEC(".maps");
+
+struct {
+	__uint(type, BPF_MAP_TYPE_RINGBUF);
+	__uint(max_entries, 8);
+} rb SEC(".maps");
+
+struct elem {
+	struct bpf_timer t;
+};
+
+struct {
+	__uint(type, BPF_MAP_TYPE_HASH);
+	__uint(max_entries, 1024);
+	__type(key, u32);
+	__type(value, struct elem);
+} timer_map SEC(".maps");
+
+/* callback for timer_map timers */
+
+static int timer_cb1(void *map, int *key, struct bpf_timer *timer)
+{
+	struct hid_bpf_ctx *hid_ctx;
+	struct test_report buf;
+	__u8 *rb_elem;
+	int err;
+	int i, ret = 0;
+
+	/* do not pop the event, it'll be done in hid_offload_test() when
+	 * notifying user space, this also allows to retry sending it
+	 * if hid_bpf_input_report fails
+	 */
+	if (bpf_map_peek_elem(&queue, &buf))
+		return 0;
+
+	hid_ctx = hid_bpf_allocate_context(*key);
+	if (!hid_ctx)
+		return 0; /* EPERM check */
+
+	buf.data[0] = 2;
+
+	/* re-inject the modified event into the HID stack */
+	err = hid_bpf_input_report(hid_ctx, HID_INPUT_REPORT, buf.data, sizeof(buf.data));
+	if (err == -16 /* -EBUSY */) {
+		/*
+		 * This happens when we schedule the work with a 0 delay:
+		 * the thread immediately starts but the current input
+		 * processing hasn't finished yet. So the semaphore is
+		 * already taken, and hid_input_report returns -EBUSY
+		 */
+		/* schedule another attempt */
+		bpf_timer_start(timer, 0, BPF_F_TIMER_SLEEPABLE);
+
+		goto out;
+	}
+
+	if (bpf_map_pop_elem(&queue, &buf))
+		goto out;
+
+	rb_elem = bpf_ringbuf_reserve(&rb, sizeof(*rb_elem), 0);
+	if (!rb_elem)
+		goto out;
+
+	*rb_elem = buf.data[1];
+
+	bpf_ringbuf_submit(rb_elem, 0);
+
+	/* call ourself once again until there is no more events in the queue */
+	bpf_timer_start(timer, 0, BPF_F_TIMER_SLEEPABLE);
+
+ out:
+	hid_bpf_release_context(hid_ctx);
+	return 0;
+}
+
+#define CLOCK_MONOTONIC		1
+
+SEC("?fmod_ret/hid_bpf_device_event")
+int BPF_PROG(hid_defer_bpf_timer, struct hid_bpf_ctx *hctx)
+{
+	__u8 *data = hid_bpf_get_data(hctx, 0 /* offset */, 4 /* size */);
+	struct test_report buf = {
+		.data = {2, 3, 4, 5, 6, 7},
+	};
+	struct bpf_timer *timer;
+	int key = hctx->hid->id;
+	struct elem init = {};
+
+	if (!data)
+		return 0; /* EPERM check */
+
+	/* Only schedule a delayed work when reportID is 1, otherwise
+	 * simply forward it to hidraw
+	 */
+	if (data[0] != 1)
+		return 0;
+
+	bpf_map_push_elem(&queue, &buf, BPF_ANY);
+	buf.data[0] = 2;
+	buf.data[1] = 4;
+	buf.data[2] = 6;
+	bpf_map_push_elem(&queue, &buf, BPF_ANY);
+
+	timer = bpf_map_lookup_elem(&timer_map, &key);
+	if (!timer)
+		return 3;
+
+	bpf_timer_set_sleepable_cb(timer, timer_cb1);
+
+	if (bpf_timer_start(timer, 0, BPF_F_TIMER_SLEEPABLE) != 0)
+		return 2;
+
+	return -1; /* discard the event */
+}
+
+SEC("syscall")
+int hid_setup_timer(struct hid_hw_request_syscall_args *args)
+{
+	struct hid_bpf_ctx *ctx;
+	struct bpf_timer *timer;
+	struct elem init = {};
+	int key = args->hid;
+	int i, ret = 0;
+
+	ctx = hid_bpf_allocate_context(args->hid);
+	if (!ctx)
+		return -1; /* EPERM check */
+
+	bpf_map_update_elem(&timer_map, &key, &init, 0);
+
+	timer = bpf_map_lookup_elem(&timer_map, &key);
+	if (!timer) {
+		hid_bpf_release_context(ctx);
+		return 1;
+	}
+
+	bpf_timer_init(timer, &timer_map, CLOCK_MONOTONIC);
+
+	hid_bpf_release_context(ctx);
+
+	return 0;
+}
+
diff --git a/tools/testing/selftests/hid/progs/hid_bpf_helpers.h b/tools/testing/selftests/hid/progs/hid_bpf_helpers.h
index 9cd56821d0f1..8235a28e7dee 100644
--- a/tools/testing/selftests/hid/progs/hid_bpf_helpers.h
+++ b/tools/testing/selftests/hid/progs/hid_bpf_helpers.h
@@ -100,5 +100,7 @@ extern int hid_bpf_input_report(struct hid_bpf_ctx *ctx,
 				enum hid_report_type type,
 				__u8 *data,
 				size_t buf__sz) __ksym;
+extern int bpf_timer_set_sleepable_cb(struct bpf_timer *timer,
+		int (callback_fn)(void *map, int *key, struct bpf_timer *timer)) __ksym;
 
 #endif /* __HID_BPF_HELPERS_H */

-- 
2.43.0


