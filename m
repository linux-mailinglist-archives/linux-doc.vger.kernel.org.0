Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60A59590F4E
	for <lists+linux-doc@lfdr.de>; Fri, 12 Aug 2022 12:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238473AbiHLKVb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 12 Aug 2022 06:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238821AbiHLKVU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Aug 2022 06:21:20 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA8874E3F;
        Fri, 12 Aug 2022 03:21:19 -0700 (PDT)
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.201])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4M404g0z77z687qT;
        Fri, 12 Aug 2022 18:18:27 +0800 (CST)
Received: from roberto-ThinkStation-P620.huawei.com (10.204.63.22) by
 fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 12 Aug 2022 12:21:15 +0200
From:   Roberto Sassu <roberto.sassu@huawei.com>
To:     <ast@kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>,
        <martin.lau@linux.dev>, <song@kernel.org>, <yhs@fb.com>,
        <john.fastabend@gmail.com>, <kpsingh@kernel.org>, <sdf@google.com>,
        <haoluo@google.com>, <jolsa@kernel.org>, <mykolal@fb.com>,
        <corbet@lwn.net>, <dhowells@redhat.com>, <jarkko@kernel.org>,
        <rostedt@goodmis.org>, <mingo@redhat.com>, <paul@paul-moore.com>,
        <jmorris@namei.org>, <serge@hallyn.com>, <shuah@kernel.org>
CC:     <bpf@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <keyrings@vger.kernel.org>,
        <linux-security-module@vger.kernel.org>,
        <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Roberto Sassu <roberto.sassu@huawei.com>
Subject: [PATCH v11 7/9] selftests/bpf: Add verifier tests for bpf_lookup_*_key() and bpf_key_put()
Date:   Fri, 12 Aug 2022 12:19:00 +0200
Message-ID: <20220812101902.2846182-8-roberto.sassu@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220812101902.2846182-1-roberto.sassu@huawei.com>
References: <20220812101902.2846182-1-roberto.sassu@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.204.63.22]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 fraeml714-chm.china.huawei.com (10.206.15.33)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add verifier tests for bpf_lookup_*_key() and bpf_key_put(), to ensure that
acquired key references stored in the bpf_key structure are released, that
a non-NULL bpf_key pointer is passed to bpf_key_put(), and that key
references are not leaked.

Also, slightly modify test_verifier.c, to find the BTF ID of the attach
point for the LSM program type (currently, it is done only for TRACING).

Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
---
 tools/testing/selftests/bpf/config            |   1 +
 tools/testing/selftests/bpf/test_verifier.c   |   3 +-
 .../selftests/bpf/verifier/ref_tracking.c     | 139 ++++++++++++++++++
 3 files changed, 142 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/config b/tools/testing/selftests/bpf/config
index fabf0c014349..c99b196aa840 100644
--- a/tools/testing/selftests/bpf/config
+++ b/tools/testing/selftests/bpf/config
@@ -30,6 +30,7 @@ CONFIG_IPV6_GRE=y
 CONFIG_IPV6_SEG6_BPF=y
 CONFIG_IPV6_SIT=m
 CONFIG_IPV6_TUNNEL=y
+CONFIG_KEYS=y
 CONFIG_LIRC=y
 CONFIG_LWTUNNEL=y
 CONFIG_MPLS=y
diff --git a/tools/testing/selftests/bpf/test_verifier.c b/tools/testing/selftests/bpf/test_verifier.c
index f9d553fbf68a..2dbcbf363c18 100644
--- a/tools/testing/selftests/bpf/test_verifier.c
+++ b/tools/testing/selftests/bpf/test_verifier.c
@@ -1498,7 +1498,8 @@ static void do_test_single(struct bpf_test *test, bool unpriv,
 		opts.log_level = DEFAULT_LIBBPF_LOG_LEVEL;
 	opts.prog_flags = pflags;
 
-	if (prog_type == BPF_PROG_TYPE_TRACING && test->kfunc) {
+	if ((prog_type == BPF_PROG_TYPE_TRACING ||
+	     prog_type == BPF_PROG_TYPE_LSM) && test->kfunc) {
 		int attach_btf_id;
 
 		attach_btf_id = libbpf_find_vmlinux_btf_id(test->kfunc,
diff --git a/tools/testing/selftests/bpf/verifier/ref_tracking.c b/tools/testing/selftests/bpf/verifier/ref_tracking.c
index 57a83d763ec1..f18ce867271f 100644
--- a/tools/testing/selftests/bpf/verifier/ref_tracking.c
+++ b/tools/testing/selftests/bpf/verifier/ref_tracking.c
@@ -84,6 +84,145 @@
 	.errstr = "Unreleased reference",
 	.result = REJECT,
 },
+{
+	"reference tracking: acquire/release user key reference",
+	.insns = {
+	BPF_MOV64_IMM(BPF_REG_1, -3),
+	BPF_MOV64_IMM(BPF_REG_2, 0),
+	BPF_RAW_INSN(BPF_JMP | BPF_CALL, 0, BPF_PSEUDO_KFUNC_CALL, 0, 0),
+	BPF_JMP_IMM(BPF_JEQ, BPF_REG_0, 0, 2),
+	BPF_MOV64_REG(BPF_REG_1, BPF_REG_0),
+	BPF_RAW_INSN(BPF_JMP | BPF_CALL, 0, BPF_PSEUDO_KFUNC_CALL, 0, 0),
+	BPF_MOV64_IMM(BPF_REG_0, 0),
+	BPF_EXIT_INSN(),
+	},
+	.prog_type = BPF_PROG_TYPE_LSM,
+	.kfunc = "bpf",
+	.expected_attach_type = BPF_LSM_MAC,
+	.flags = BPF_F_SLEEPABLE,
+	.fixup_kfunc_btf_id = {
+		{ "bpf_lookup_user_key", 2 },
+		{ "bpf_key_put", 5 },
+	},
+	.result = ACCEPT,
+},
+{
+	"reference tracking: acquire/release system key reference",
+	.insns = {
+	BPF_MOV64_IMM(BPF_REG_1, 1),
+	BPF_RAW_INSN(BPF_JMP | BPF_CALL, 0, BPF_PSEUDO_KFUNC_CALL, 0, 0),
+	BPF_JMP_IMM(BPF_JEQ, BPF_REG_0, 0, 2),
+	BPF_MOV64_REG(BPF_REG_1, BPF_REG_0),
+	BPF_RAW_INSN(BPF_JMP | BPF_CALL, 0, BPF_PSEUDO_KFUNC_CALL, 0, 0),
+	BPF_MOV64_IMM(BPF_REG_0, 0),
+	BPF_EXIT_INSN(),
+	},
+	.prog_type = BPF_PROG_TYPE_LSM,
+	.kfunc = "bpf",
+	.expected_attach_type = BPF_LSM_MAC,
+	.flags = BPF_F_SLEEPABLE,
+	.fixup_kfunc_btf_id = {
+		{ "bpf_lookup_system_key", 1 },
+		{ "bpf_key_put", 4 },
+	},
+	.result = ACCEPT,
+},
+{
+	"reference tracking: release user key reference without check",
+	.insns = {
+	BPF_MOV64_IMM(BPF_REG_1, -3),
+	BPF_MOV64_IMM(BPF_REG_2, 0),
+	BPF_RAW_INSN(BPF_JMP | BPF_CALL, 0, BPF_PSEUDO_KFUNC_CALL, 0, 0),
+	BPF_MOV64_REG(BPF_REG_1, BPF_REG_0),
+	BPF_RAW_INSN(BPF_JMP | BPF_CALL, 0, BPF_PSEUDO_KFUNC_CALL, 0, 0),
+	BPF_MOV64_IMM(BPF_REG_0, 0),
+	BPF_EXIT_INSN(),
+	},
+	.prog_type = BPF_PROG_TYPE_LSM,
+	.kfunc = "bpf",
+	.expected_attach_type = BPF_LSM_MAC,
+	.flags = BPF_F_SLEEPABLE,
+	.errstr = "arg#0 pointer type STRUCT bpf_key must point to scalar, or struct with scalar",
+	.fixup_kfunc_btf_id = {
+		{ "bpf_lookup_user_key", 2 },
+		{ "bpf_key_put", 4 },
+	},
+	.result = REJECT,
+},
+{
+	"reference tracking: release system key reference without check",
+	.insns = {
+	BPF_MOV64_IMM(BPF_REG_1, 1),
+	BPF_RAW_INSN(BPF_JMP | BPF_CALL, 0, BPF_PSEUDO_KFUNC_CALL, 0, 0),
+	BPF_MOV64_REG(BPF_REG_1, BPF_REG_0),
+	BPF_RAW_INSN(BPF_JMP | BPF_CALL, 0, BPF_PSEUDO_KFUNC_CALL, 0, 0),
+	BPF_MOV64_IMM(BPF_REG_0, 0),
+	BPF_EXIT_INSN(),
+	},
+	.prog_type = BPF_PROG_TYPE_LSM,
+	.kfunc = "bpf",
+	.expected_attach_type = BPF_LSM_MAC,
+	.flags = BPF_F_SLEEPABLE,
+	.errstr = "arg#0 pointer type STRUCT bpf_key must point to scalar, or struct with scalar",
+	.fixup_kfunc_btf_id = {
+		{ "bpf_lookup_system_key", 1 },
+		{ "bpf_key_put", 3 },
+	},
+	.result = REJECT,
+},
+{
+	"reference tracking: release with NULL key pointer",
+	.insns = {
+	BPF_MOV64_IMM(BPF_REG_1, 0),
+	BPF_RAW_INSN(BPF_JMP | BPF_CALL, 0, BPF_PSEUDO_KFUNC_CALL, 0, 0),
+	BPF_MOV64_IMM(BPF_REG_0, 0),
+	BPF_EXIT_INSN(),
+	},
+	.prog_type = BPF_PROG_TYPE_LSM,
+	.kfunc = "bpf",
+	.expected_attach_type = BPF_LSM_MAC,
+	.flags = BPF_F_SLEEPABLE,
+	.errstr = "arg#0 pointer type STRUCT bpf_key must point to scalar, or struct with scalar",
+	.fixup_kfunc_btf_id = {
+		{ "bpf_key_put", 1 },
+	},
+	.result = REJECT,
+},
+{
+	"reference tracking: leak potential reference to user key",
+	.insns = {
+	BPF_MOV64_IMM(BPF_REG_1, -3),
+	BPF_MOV64_IMM(BPF_REG_2, 0),
+	BPF_RAW_INSN(BPF_JMP | BPF_CALL, 0, BPF_PSEUDO_KFUNC_CALL, 0, 0),
+	BPF_EXIT_INSN(),
+	},
+	.prog_type = BPF_PROG_TYPE_LSM,
+	.kfunc = "bpf",
+	.expected_attach_type = BPF_LSM_MAC,
+	.flags = BPF_F_SLEEPABLE,
+	.errstr = "Unreleased reference",
+	.fixup_kfunc_btf_id = {
+		{ "bpf_lookup_user_key", 2 },
+	},
+	.result = REJECT,
+},
+{
+	"reference tracking: leak potential reference to system key",
+	.insns = {
+	BPF_MOV64_IMM(BPF_REG_1, 1),
+	BPF_RAW_INSN(BPF_JMP | BPF_CALL, 0, BPF_PSEUDO_KFUNC_CALL, 0, 0),
+	BPF_EXIT_INSN(),
+	},
+	.prog_type = BPF_PROG_TYPE_LSM,
+	.kfunc = "bpf",
+	.expected_attach_type = BPF_LSM_MAC,
+	.flags = BPF_F_SLEEPABLE,
+	.errstr = "Unreleased reference",
+	.fixup_kfunc_btf_id = {
+		{ "bpf_lookup_system_key", 1 },
+	},
+	.result = REJECT,
+},
 {
 	"reference tracking: release reference without check",
 	.insns = {
-- 
2.25.1

