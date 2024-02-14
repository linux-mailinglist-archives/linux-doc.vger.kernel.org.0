Return-Path: <linux-doc+bounces-9376-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AB1854FCC
	for <lists+linux-doc@lfdr.de>; Wed, 14 Feb 2024 18:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E60F1F22D5A
	for <lists+linux-doc@lfdr.de>; Wed, 14 Feb 2024 17:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9901F7E0EA;
	Wed, 14 Feb 2024 17:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pKaugZ7p"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6466584FCD;
	Wed, 14 Feb 2024 17:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707931150; cv=none; b=vGu4n4QheMzZ4PnBUguxfFr6rPNMsHSohwU/o4JK/UR3mAb3vpgYdEGmZ35JelWJVegi+KehwpRGmKOHsREVnaJgPiCX3RjnHWbBGH26mFa7EDqCriQqBXpRh4Q63MaVpioTCuTcFEc6oUCL2ut4QePsx3mN9d4gS02F7eT5wig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707931150; c=relaxed/simple;
	bh=LjjQ9QpSVv5Grn2hLf1mKwXw2hs0FHcfxkNuAvSb4nw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dc25uUJStu5gKetLufO+BPbjJp+Old1e3uWbPjq8zk6DwzsvLABHDg2JdjttgWkJ708nyq7ovPNvamS/co2KgNKc55swNF9wB+bKSkSH0Ak7qCSHx/5c/MHs6ptclEp6RpRZ83M+5Zbnd+f1/3nGEL9htvCzCIfmjiwuNdFui6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pKaugZ7p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEAABC433F1;
	Wed, 14 Feb 2024 17:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707931148;
	bh=LjjQ9QpSVv5Grn2hLf1mKwXw2hs0FHcfxkNuAvSb4nw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pKaugZ7pOKT3AXUGpDiBALEHVHKk31W1ZF5lxnAs8bpRPXThUvfypRHsTKly1OEXM
	 Gkdp94EIfgrzGZO9R9HaE3xaw7Dcx73E4ORMo5fnCmG2JZleiQuX/4viDfmj+SgyPT
	 KmvTE4hpYIDuyv8GST6ImG6ZU7WafSNvIkHWGwhB985QGNd0UaHpHw69bFTW3KmanR
	 DAUECWoWnVRhz8HyZb3TZw7oGOESilPn3qXaOSrbOxJcmaF10VVRETDgLK2KZTLqH+
	 9cQsbh7TZbw9OmgBrHfIbaOjEzJ/qEIojur1DYd7hLZ15D1UVzceZjViCY3dsNj94h
	 90eNnzrkUz72Q==
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Wed, 14 Feb 2024 18:18:31 +0100
Subject: [PATCH RFC bpf-next v2 02/10] bpf/helpers: introduce sleepable
 timers
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240214-hid-bpf-sleepable-v2-2-5756b054724d@kernel.org>
References: <20240214-hid-bpf-sleepable-v2-0-5756b054724d@kernel.org>
In-Reply-To: <20240214-hid-bpf-sleepable-v2-0-5756b054724d@kernel.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707931135; l=17650;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=LjjQ9QpSVv5Grn2hLf1mKwXw2hs0FHcfxkNuAvSb4nw=;
 b=2rv+f3Xy4jyPKp1W0A/osjfNN0RmsCvKLgqQp42biFek1oFMpExgV+oZOzKmTuDLNqV+Klarq
 ttBZi0TscXmAIIRABCNWt8wZkJZLApAV6PTR8vrvS6F3tHm1GzboKgp
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

They are implemented as a kfunc, which means a little bit of tweaks in
the verifier.

Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>

---

changes in v2 (compared to the one attaches to v1 0/9):
- make use of a kfunc
- add a (non-used) BPF_F_TIMER_SLEEPABLE
- the callback is *not* called, it makes the kernel crashes
---
 include/linux/bpf_verifier.h |   2 +
 include/uapi/linux/bpf.h     |  12 +++++
 kernel/bpf/helpers.c         | 105 ++++++++++++++++++++++++++++++++++++++++---
 kernel/bpf/verifier.c        |  72 ++++++++++++++++++++++++++---
 4 files changed, 180 insertions(+), 11 deletions(-)

diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
index 84365e6dd85d..789ef5fec547 100644
--- a/include/linux/bpf_verifier.h
+++ b/include/linux/bpf_verifier.h
@@ -426,6 +426,7 @@ struct bpf_verifier_state {
 	 * while they are still in use.
 	 */
 	bool used_as_loop_entry;
+	bool in_sleepable;
 
 	/* first and last insn idx of this verifier state */
 	u32 first_insn_idx;
@@ -626,6 +627,7 @@ struct bpf_subprog_info {
 	bool is_async_cb: 1;
 	bool is_exception_cb: 1;
 	bool args_cached: 1;
+	bool is_sleepable: 1;
 
 	u8 arg_cnt;
 	struct bpf_subprog_arg_info args[MAX_BPF_FUNC_REG_ARGS];
diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index d96708380e52..0838597028a9 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -7427,6 +7427,18 @@ enum {
 	BPF_F_TIMER_CPU_PIN = (1ULL << 1),
 };
 
+/* Extra flags to control bpf_timer_init() behaviour, in addition to CLOCK_*.
+ *     - BPF_F_TIMER_SLEEPABLE: Timer will run in a workqueue in a sleepable
+ *       context.
+ */
+enum {
+	/* CLOCK_* are using bits 0 to 3 */
+	BPF_F_TIMER_SLEEPABLE = (1ULL << 4),
+	__MAX_BPF_F_TIMER_INIT,
+};
+
+#define MAX_BPF_F_TIMER_INIT __MAX_BPF_F_TIMER_INIT
+
 /* BPF numbers iterator state */
 struct bpf_iter_num {
 	/* opaque iterator state; having __u64 here allows to preserve correct
diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index 4db1c658254c..2dbc09ce841a 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -1097,9 +1097,11 @@ const struct bpf_func_proto bpf_snprintf_proto = {
  */
 struct bpf_hrtimer {
 	struct hrtimer timer;
+	struct work_struct work;
 	struct bpf_map *map;
 	struct bpf_prog *prog;
 	void __rcu *callback_fn;
+	void __rcu *sleepable_cb_fn;
 	void *value;
 };
 
@@ -1113,18 +1115,59 @@ struct bpf_timer_kern {
 	struct bpf_spin_lock lock;
 } __attribute__((aligned(8)));
 
+static void bpf_timer_work_cb(struct work_struct *work)
+{
+	struct bpf_hrtimer *t = container_of(work, struct bpf_hrtimer, work);
+	struct bpf_map *map = t->map;
+	void *value = t->value;
+	bpf_callback_t callback_fn;
+	void *key;
+	u32 idx;
+
+	BTF_TYPE_EMIT(struct bpf_timer);
+
+	rcu_read_lock();
+	callback_fn = rcu_dereference(t->sleepable_cb_fn);
+	rcu_read_unlock();
+	if (!callback_fn)
+		return;
+
+	/* FIXME: do we need any locking? */
+	if (map->map_type == BPF_MAP_TYPE_ARRAY) {
+		struct bpf_array *array = container_of(map, struct bpf_array, map);
+
+		/* compute the key */
+		idx = ((char *)value - array->value) / array->elem_size;
+		key = &idx;
+	} else { /* hash or lru */
+		key = value - round_up(map->key_size, 8);
+	}
+
+	/* FIXME: this crashes the system with
+	 * BUG: kernel NULL pointer dereference, address: 000000000000000b
+	 */
+	/* callback_fn((u64)(long)map, (u64)(long)key, (u64)(long)value, 0, 0); */
+	/* The verifier checked that return value is zero. */
+}
+
 static DEFINE_PER_CPU(struct bpf_hrtimer *, hrtimer_running);
 
 static enum hrtimer_restart bpf_timer_cb(struct hrtimer *hrtimer)
 {
 	struct bpf_hrtimer *t = container_of(hrtimer, struct bpf_hrtimer, timer);
+	bpf_callback_t callback_fn, sleepable_cb_fn;
 	struct bpf_map *map = t->map;
 	void *value = t->value;
-	bpf_callback_t callback_fn;
 	void *key;
 	u32 idx;
 
 	BTF_TYPE_EMIT(struct bpf_timer);
+	sleepable_cb_fn = rcu_dereference_check(t->sleepable_cb_fn, rcu_read_lock_bh_held());
+	if (sleepable_cb_fn) {
+		schedule_work(&t->work);
+		goto out;
+	}
+
 	callback_fn = rcu_dereference_check(t->callback_fn, rcu_read_lock_bh_held());
 	if (!callback_fn)
 		goto out;
@@ -1154,10 +1197,14 @@ static enum hrtimer_restart bpf_timer_cb(struct hrtimer *hrtimer)
 	return HRTIMER_NORESTART;
 }
 
+#define BPF_TIMER_CLOCK_MASK (MAX_CLOCKS - 1)  /* 0xf */
+#define BPF_TIMER_FLAGS_MASK GENMASK_ULL(63, 4)
+
 BPF_CALL_3(bpf_timer_init, struct bpf_timer_kern *, timer, struct bpf_map *, map,
 	   u64, flags)
 {
-	clockid_t clockid = flags & (MAX_CLOCKS - 1);
+	clockid_t clockid = flags & BPF_TIMER_CLOCK_MASK;
+	u64 bpf_timer_flags = flags & BPF_TIMER_FLAGS_MASK;
 	struct bpf_hrtimer *t;
 	int ret = 0;
 
@@ -1168,7 +1215,7 @@ BPF_CALL_3(bpf_timer_init, struct bpf_timer_kern *, timer, struct bpf_map *, map
 	if (in_nmi())
 		return -EOPNOTSUPP;
 
-	if (flags >= MAX_CLOCKS ||
+	if (bpf_timer_flags & ~(BPF_F_TIMER_SLEEPABLE) ||
 	    /* similar to timerfd except _ALARM variants are not supported */
 	    (clockid != CLOCK_MONOTONIC &&
 	     clockid != CLOCK_REALTIME &&
@@ -1190,7 +1237,10 @@ BPF_CALL_3(bpf_timer_init, struct bpf_timer_kern *, timer, struct bpf_map *, map
 	t->map = map;
 	t->prog = NULL;
 	rcu_assign_pointer(t->callback_fn, NULL);
+	rcu_assign_pointer(t->sleepable_cb_fn, NULL);
+	/* FIXME: probably do something about the SLEEPABLE flag */
 	hrtimer_init(&t->timer, clockid, HRTIMER_MODE_REL_SOFT);
+	INIT_WORK(&t->work, bpf_timer_work_cb);
 	t->timer.function = bpf_timer_cb;
 	WRITE_ONCE(timer->timer, t);
 	/* Guarantee the order between timer->timer and map->usercnt. So
@@ -1221,8 +1271,8 @@ static const struct bpf_func_proto bpf_timer_init_proto = {
 	.arg3_type	= ARG_ANYTHING,
 };
 
-BPF_CALL_3(bpf_timer_set_callback, struct bpf_timer_kern *, timer, void *, callback_fn,
-	   struct bpf_prog_aux *, aux)
+static int __bpf_timer_set_callback(struct bpf_timer_kern *timer, void *callback_fn,
+				    struct bpf_prog_aux *aux, bool is_sleepable)
 {
 	struct bpf_prog *prev, *prog = aux->prog;
 	struct bpf_hrtimer *t;
@@ -1260,12 +1310,24 @@ BPF_CALL_3(bpf_timer_set_callback, struct bpf_timer_kern *, timer, void *, callb
 			bpf_prog_put(prev);
 		t->prog = prog;
 	}
-	rcu_assign_pointer(t->callback_fn, callback_fn);
+	if (is_sleepable) {
+		rcu_assign_pointer(t->sleepable_cb_fn, callback_fn);
+		rcu_assign_pointer(t->callback_fn, NULL);
+	} else {
+		rcu_assign_pointer(t->callback_fn, callback_fn);
+		rcu_assign_pointer(t->sleepable_cb_fn, NULL);
+	}
 out:
 	__bpf_spin_unlock_irqrestore(&timer->lock);
 	return ret;
 }
 
+BPF_CALL_3(bpf_timer_set_callback, struct bpf_timer_kern *, timer, void *, callback_fn,
+	   struct bpf_prog_aux *, aux)
+{
+	return __bpf_timer_set_callback(timer, callback_fn, aux, false);
+}
+
 static const struct bpf_func_proto bpf_timer_set_callback_proto = {
 	.func		= bpf_timer_set_callback,
 	.gpl_only	= true,
@@ -1353,6 +1415,7 @@ BPF_CALL_1(bpf_timer_cancel, struct bpf_timer_kern *, timer)
 	 * if it was running.
 	 */
 	ret = ret ?: hrtimer_cancel(&t->timer);
+	ret = ret ?: cancel_work_sync(&t->work);
 	return ret;
 }
 
@@ -1407,6 +1470,8 @@ void bpf_timer_cancel_and_free(void *val)
 	 */
 	if (this_cpu_read(hrtimer_running) != t)
 		hrtimer_cancel(&t->timer);
+
+	cancel_work_sync(&t->work);
 	kfree(t);
 }
 
@@ -2542,6 +2607,33 @@ __bpf_kfunc void bpf_throw(u64 cookie)
 	WARN(1, "A call to BPF exception callback should never return\n");
 }
 
+/* FIXME: use kernel doc style */
+/* Description
+ *	Configure the timer to call *callback_fn* static function in a
+ *	sleepable context.
+ * Return
+ *	0 on success.
+ *	**-EINVAL** if *timer* was not initialized with bpf_timer_init() earlier.
+ *	**-EPERM** if *timer* is in a map that doesn't have any user references.
+ *	The user space should either hold a file descriptor to a map with timers
+ *	or pin such map in bpffs. When map is unpinned or file descriptor is
+ *	closed all timers in the map will be cancelled and freed.
+ */
+__bpf_kfunc int bpf_timer_set_sleepable_cb(struct bpf_timer_kern *timer,
+					   int (callback_fn)(void *map, int *key, struct bpf_timer *timer))
+{
+	struct bpf_throw_ctx ctx = {};
+
+	/* FIXME: definietely not sure this is OK */
+	arch_bpf_stack_walk(bpf_stack_walker, &ctx);
+	WARN_ON_ONCE(!ctx.aux);
+
+	if (!ctx.aux)
+		return -EINVAL;
+
+	return __bpf_timer_set_callback(timer, (void *)callback_fn, ctx.aux, true);
+}
+
 __bpf_kfunc_end_defs();
 
 BTF_KFUNCS_START(generic_btf_ids)
@@ -2573,6 +2665,7 @@ BTF_ID_FLAGS(func, bpf_task_get_cgroup1, KF_ACQUIRE | KF_RCU | KF_RET_NULL)
 #endif
 BTF_ID_FLAGS(func, bpf_task_from_pid, KF_ACQUIRE | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_throw)
+BTF_ID_FLAGS(func, bpf_timer_set_sleepable_cb)
 BTF_KFUNCS_END(generic_btf_ids)
 
 static const struct btf_kfunc_id_set generic_kfunc_set = {
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 7831adba9abf..67da3f7bddb5 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -503,6 +503,8 @@ static bool is_dynptr_ref_function(enum bpf_func_id func_id)
 static bool is_sync_callback_calling_kfunc(u32 btf_id);
 static bool is_bpf_throw_kfunc(struct bpf_insn *insn);
 
+static bool is_bpf_timer_set_sleepable_cb_kfunc(u32 btf_id);
+
 static bool is_sync_callback_calling_function(enum bpf_func_id func_id)
 {
 	return func_id == BPF_FUNC_for_each_map_elem ||
@@ -513,7 +515,8 @@ static bool is_sync_callback_calling_function(enum bpf_func_id func_id)
 
 static bool is_async_callback_calling_function(enum bpf_func_id func_id)
 {
-	return func_id == BPF_FUNC_timer_set_callback;
+	return func_id == BPF_FUNC_timer_set_callback ||
+	       is_bpf_timer_set_sleepable_cb_kfunc(func_id);
 }
 
 static bool is_callback_calling_function(enum bpf_func_id func_id)
@@ -1414,6 +1417,7 @@ static int copy_verifier_state(struct bpf_verifier_state *dst_state,
 	}
 	dst_state->speculative = src->speculative;
 	dst_state->active_rcu_lock = src->active_rcu_lock;
+	dst_state->in_sleepable = src->in_sleepable;
 	dst_state->curframe = src->curframe;
 	dst_state->active_lock.ptr = src->active_lock.ptr;
 	dst_state->active_lock.id = src->active_lock.id;
@@ -2413,6 +2417,7 @@ static struct bpf_verifier_state *push_async_cb(struct bpf_verifier_env *env,
 	 * Initialize it similar to do_check_common().
 	 */
 	elem->st.branches = 1;
+	elem->st.in_sleepable = env->subprog_info[subprog].is_sleepable;
 	frame = kzalloc(sizeof(*frame), GFP_KERNEL);
 	if (!frame)
 		goto err;
@@ -5257,7 +5262,8 @@ static int map_kptr_match_type(struct bpf_verifier_env *env,
 
 static bool in_sleepable(struct bpf_verifier_env *env)
 {
-	return env->prog->aux->sleepable;
+	return env->prog->aux->sleepable ||
+	       (env->cur_state && env->cur_state->in_sleepable);
 }
 
 /* The non-sleepable programs and sleepable programs with explicit bpf_rcu_read_lock()
@@ -5439,6 +5445,26 @@ static int check_map_access(struct bpf_verifier_env *env, u32 regno,
 					return -EACCES;
 				}
 				break;
+			case BPF_TIMER:
+				/* FIXME: kptr does the above, should we use the same? */
+				if (src != ACCESS_DIRECT) {
+					verbose(env, "bpf_timer cannot be accessed indirectly by helper\n");
+					return -EACCES;
+				}
+				if (!tnum_is_const(reg->var_off)) {
+					verbose(env, "bpf_timer access cannot have variable offset\n");
+					return -EACCES;
+				}
+				if (p != off + reg->var_off.value) {
+					verbose(env, "bpf_timer access misaligned expected=%u off=%llu\n",
+						p, off + reg->var_off.value);
+					return -EACCES;
+				}
+				if (size != bpf_size_to_bytes(BPF_DW)) {
+					verbose(env, "bpf_timer access size must be BPF_DW\n");
+					return -EACCES;
+				}
+				break;
 			default:
 				verbose(env, "%s cannot be accessed directly by load/store\n",
 					btf_field_type_name(field->type));
@@ -9439,11 +9465,13 @@ static int push_callback_call(struct bpf_verifier_env *env, struct bpf_insn *ins
 
 	if (insn->code == (BPF_JMP | BPF_CALL) &&
 	    insn->src_reg == 0 &&
-	    insn->imm == BPF_FUNC_timer_set_callback) {
+	    (insn->imm == BPF_FUNC_timer_set_callback ||
+	     is_bpf_timer_set_sleepable_cb_kfunc(insn->imm))) {
 		struct bpf_verifier_state *async_cb;
 
 		/* there is no real recursion here. timer callbacks are async */
 		env->subprog_info[subprog].is_async_cb = true;
+		env->subprog_info[subprog].is_sleepable = is_bpf_timer_set_sleepable_cb_kfunc(insn->imm);
 		async_cb = push_async_cb(env, env->subprog_info[subprog].start,
 					 insn_idx, subprog);
 		if (!async_cb)
@@ -10412,6 +10440,10 @@ static int check_helper_call(struct bpf_verifier_env *env, struct bpf_insn *insn
 		break;
 	}
 
+	if (is_bpf_timer_set_sleepable_cb_kfunc(func_id))
+		err = push_callback_call(env, insn, insn_idx, meta.subprogno,
+					 set_timer_callback_state);
+
 	if (err)
 		return err;
 
@@ -10789,6 +10821,7 @@ enum {
 	KF_ARG_LIST_NODE_ID,
 	KF_ARG_RB_ROOT_ID,
 	KF_ARG_RB_NODE_ID,
+	KF_ARG_TIMER_ID,
 };
 
 BTF_ID_LIST(kf_arg_btf_ids)
@@ -10797,6 +10830,7 @@ BTF_ID(struct, bpf_list_head)
 BTF_ID(struct, bpf_list_node)
 BTF_ID(struct, bpf_rb_root)
 BTF_ID(struct, bpf_rb_node)
+BTF_ID(struct, bpf_timer_kern)
 
 static bool __is_kfunc_ptr_arg_type(const struct btf *btf,
 				    const struct btf_param *arg, int type)
@@ -10840,6 +10874,12 @@ static bool is_kfunc_arg_rbtree_node(const struct btf *btf, const struct btf_par
 	return __is_kfunc_ptr_arg_type(btf, arg, KF_ARG_RB_NODE_ID);
 }
 
+static bool is_kfunc_arg_timer(const struct btf *btf, const struct btf_param *arg)
+{
+	bool ret = __is_kfunc_ptr_arg_type(btf, arg, KF_ARG_TIMER_ID);
+	return ret;
+}
+
 static bool is_kfunc_arg_callback(struct bpf_verifier_env *env, const struct btf *btf,
 				  const struct btf_param *arg)
 {
@@ -10908,6 +10948,7 @@ enum kfunc_ptr_arg_type {
 	KF_ARG_PTR_TO_RB_NODE,
 	KF_ARG_PTR_TO_NULL,
 	KF_ARG_PTR_TO_CONST_STR,
+	KF_ARG_PTR_TO_TIMER,
 };
 
 enum special_kfunc_type {
@@ -10934,6 +10975,7 @@ enum special_kfunc_type {
 	KF_bpf_percpu_obj_drop_impl,
 	KF_bpf_throw,
 	KF_bpf_iter_css_task_new,
+	KF_bpf_timer_set_sleepable_cb,
 };
 
 BTF_SET_START(special_kfunc_set)
@@ -10960,6 +11002,7 @@ BTF_ID(func, bpf_throw)
 #ifdef CONFIG_CGROUPS
 BTF_ID(func, bpf_iter_css_task_new)
 #endif
+BTF_ID(func, bpf_timer_set_sleepable_cb)
 BTF_SET_END(special_kfunc_set)
 
 BTF_ID_LIST(special_kfunc_list)
@@ -10990,6 +11033,7 @@ BTF_ID(func, bpf_iter_css_task_new)
 #else
 BTF_ID_UNUSED
 #endif
+BTF_ID(func, bpf_timer_set_sleepable_cb)
 
 static bool is_kfunc_ret_null(struct bpf_kfunc_call_arg_meta *meta)
 {
@@ -11061,6 +11105,9 @@ get_kfunc_ptr_arg_type(struct bpf_verifier_env *env,
 	if (is_kfunc_arg_const_str(meta->btf, &args[argno]))
 		return KF_ARG_PTR_TO_CONST_STR;
 
+	if (is_kfunc_arg_timer(meta->btf, &args[argno]))
+		return KF_ARG_PTR_TO_TIMER;
+
 	if ((base_type(reg->type) == PTR_TO_BTF_ID || reg2btf_ids[base_type(reg->type)])) {
 		if (!btf_type_is_struct(ref_t)) {
 			verbose(env, "kernel function %s args#%d pointer type %s %s is not supported\n",
@@ -11318,6 +11365,11 @@ static bool is_bpf_throw_kfunc(struct bpf_insn *insn)
 	       insn->imm == special_kfunc_list[KF_bpf_throw];
 }
 
+static bool is_bpf_timer_set_sleepable_cb_kfunc(u32 btf_id)
+{
+	return btf_id == special_kfunc_list[KF_bpf_timer_set_sleepable_cb];
+}
+
 static bool is_rbtree_lock_required_kfunc(u32 btf_id)
 {
 	return is_bpf_rbtree_api_kfunc(btf_id);
@@ -11693,6 +11745,7 @@ static int check_kfunc_args(struct bpf_verifier_env *env, struct bpf_kfunc_call_
 		case KF_ARG_PTR_TO_CALLBACK:
 		case KF_ARG_PTR_TO_REFCOUNTED_KPTR:
 		case KF_ARG_PTR_TO_CONST_STR:
+		case KF_ARG_PTR_TO_TIMER:
 			/* Trusted by default */
 			break;
 		default:
@@ -11973,6 +12026,9 @@ static int check_kfunc_args(struct bpf_verifier_env *env, struct bpf_kfunc_call_
 			if (ret)
 				return ret;
 			break;
+		case KF_ARG_PTR_TO_TIMER:
+			/* FIXME: should we do anything here? */
+			break;
 		}
 	}
 
@@ -15591,7 +15647,9 @@ static int visit_insn(int t, struct bpf_verifier_env *env)
 		return DONE_EXPLORING;
 
 	case BPF_CALL:
-		if (insn->src_reg == 0 && insn->imm == BPF_FUNC_timer_set_callback)
+		if (insn->src_reg == 0 &&
+		    (insn->imm == BPF_FUNC_timer_set_callback ||
+		     is_bpf_timer_set_sleepable_cb_kfunc(insn->imm)))
 			/* Mark this call insn as a prune point to trigger
 			 * is_state_visited() check before call itself is
 			 * processed by __check_func_call(). Otherwise new
@@ -16767,6 +16825,9 @@ static bool states_equal(struct bpf_verifier_env *env,
 	if (old->active_rcu_lock != cur->active_rcu_lock)
 		return false;
 
+	if (old->in_sleepable != cur->in_sleepable)
+		return false;
+
 	/* for states to be equal callsites have to be the same
 	 * and all frame states need to be equivalent
 	 */
@@ -19644,7 +19705,8 @@ static int do_misc_fixups(struct bpf_verifier_env *env)
 			continue;
 		}
 
-		if (insn->imm == BPF_FUNC_timer_set_callback) {
+		if (insn->imm == BPF_FUNC_timer_set_callback ||
+		    is_bpf_timer_set_sleepable_cb_kfunc(insn->imm)) {
 			/* The verifier will process callback_fn as many times as necessary
 			 * with different maps and the register states prepared by
 			 * set_timer_callback_state will be accurate.

-- 
2.43.0


