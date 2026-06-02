Return-Path: <linux-doc+bounces-90525-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 34pbKFHuHmo+ZQAAu9opvQ
	(envelope-from <linux-doc+bounces-90525-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 16:53:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C1862F7B2
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 16:53:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=nKb6xbwj;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90525-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-90525-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A58693114863
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2026 14:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F53940626B;
	Tue,  2 Jun 2026 14:27:30 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667F7402B8F
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 14:27:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780410450; cv=none; b=eBHjeodTsORLHt4cOV8RovrbZ6YL3HYqrC8J4hRA3h5KN4oh6f4XuES5Uubj2xrAyzxwFpJ2h3V8mhUwCEdbJhTGXR45UQkNSRcyof54KquVh6tgwZf8QYIogn7SRB08VTGeX9SKJBqWhbfyViPjgOQlS9M1ilVK1ppsDVc0Yps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780410450; c=relaxed/simple;
	bh=ESmfjIh7MN23IeBJPxwPdBU7xBIa18aM//caXhGjZcM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ER4SQ32Yetw1h/HUQoMI5kZo+5tmpTNFXnV2kq0UhZJV64YmP1c06vuqWIccoi7jRasPgx9bzJzIUR2B6r2l6w76bU4BrVKRlG8val9J/UkV3WvrOTwbv6/xEdJ3BHwZ+Zposn6Ncq/v5r4XZVcwZU2TWpEMZ90qKB8Ppdb7egI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nKb6xbwj; arc=none smtp.client-ip=209.85.221.43
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso1533616f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 07:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780410447; x=1781015247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXjR0tiVSlnNG0AciIMM1oZd4f63sbXFpo0GMT42zX4=;
        b=nKb6xbwj3tP8iZMpReZNNT6dFQ54cs+fIsXJZzkzEpY/L9cznx0sOzeoS/3ITOlc1B
         73QsScaMkcLsA0Dro4o9UWHyKZPKZb3ba9yTo8rPrzY1VAbqwayCwOvm0sEJSl3iO5HN
         OAlbVFU8fqgufRBsw7s73OIDFakRQJAJEdkEiVOsgFPpnnbG3S6lyNDGsf27E/dQa85n
         PacYZcthUKtgIvSPJLX0GDBeGSxH00Yafn0kvj9BHRG0otz+jUn93XbW1Gg2p2OpqJA8
         0P0+Xf1fMuVxG1zJsKTRO8EEqN0OUNsEGaac8zEm0DgQuOHf/nx/Yq0jA5PKMWJpshQ2
         10MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780410447; x=1781015247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pXjR0tiVSlnNG0AciIMM1oZd4f63sbXFpo0GMT42zX4=;
        b=S9kxJqXPGCfY34G2I2XOdpJXmBtZNHKcYUIjtF/lUdW98L39aKmg/SeY9d3Z/RK6rN
         DlmVqE/aJW4WpZiUglB0BxoDpubIWA5XF9iFk/TKcZxBJkTZ1IjT+gRH8IYGNIkP5IS+
         ysloBgqJBocXa2HkmxtvZcd2KFcdn7e1precj/bOKa8jp5LYfz7MPbLv3UIKQfSM4qLb
         iFcOMNcKJgV/IMIGS7N/prusioQnQ4DYozpYvdtqF+VotU0XR3AxcWnTgC/+d6jVT9yE
         9JD19IsMq4dq7OdWx7rCtFdg2KutwhNz88KVlE0BxrySrLirw9G1dIHwXOU4I23mreYN
         ++dA==
X-Forwarded-Encrypted: i=1; AFNElJ80I4tD8mOCAxSsgLqISjjdr3VPvMZsN2ABQ2lYG4MBRq2eyDP7PYMSfZCKYDFFKyt59Ylv5we0pec=@vger.kernel.org
X-Gm-Message-State: AOJu0YzukS7FAR07hYeiFAuaIW9DiEma5dm20Xz479ozXuIiGQwQMcSY
	Vje2zRvdGn/QotKVgJcVLVw+omhh+Ug+Oi65m53E9Y7QF8XF+7WLxeTLyCdSY+nOLIQ=
X-Gm-Gg: Acq92OEWNPWyHVjt84gia3iacGCvJsYyXPVrqIAhP8i+Y5GXcCU79QQFC8jNxyNn4O5
	4BsMLs91tU/gHpBtEIirSJEnq7ooHXEtkQikGH0Rhh9IW0GpqcuKX8W/H94+qJOs1qoGTCKBXiV
	60IQ7OSk9HMAiPmY9nW9d943GHJlhoan6y47iu9AvaaOdsE1Dn3JLAVH5jVF0IU1tE1Db9KHHrf
	TrgRyKiExPAFg9RPMGCdL/ifIe/1BldcBNyFEql+WdozKrBlwdMHcNz3U79nIJ/bvRIcNBghP8O
	3VFzMww5LtGNzkrPDC2t0fpyILKaAhY4zt79v45P1SFm1R6yGDTJnfGDyjeHynQ1GMYmkDGEYxd
	KMWfNCe0iMxmTYr0E9Me1bUAELhK681+DJ8QMWP3QdfnRIR9CuX3vAg3CseAMupXIOdg3Ttpf4U
	oOF8gxZtJw507s+UqeYHhjQ81fVrQyJ6i7kSZyH8+5Ldw=
X-Received: by 2002:a05:600c:6098:b0:490:b1b8:95f5 with SMTP id 5b1f17b1804b1-490b1b89725mr62646115e9.15.1780410446812;
        Tue, 02 Jun 2026 07:27:26 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e18e1csm66771965e9.4.2026.06.02.07.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:27:26 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 02 Jun 2026 15:26:48 +0100
Subject: [PATCH v2 06/18] perf test cs-etm: Replace unroll loop thread with
 deterministic decode test
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-james-cs-context-tracking-fix-v2-6-85b5ce6f55c6@linaro.org>
References: <20260602-james-cs-context-tracking-fix-v2-0-85b5ce6f55c6@linaro.org>
In-Reply-To: <20260602-james-cs-context-tracking-fix-v2-0-85b5ce6f55c6@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Amir Ayupov <aaupov@meta.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Paschalis Mpeis <Paschalis.Mpeis@arm.com>
Cc: coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90525-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:leo.yan@arm.com,m:acme@kernel.org,m:namhyung@kernel.org,m:jolsa@kernel.org,m:irogers@google.com,m:aaupov@meta.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:Paschalis.Mpeis@arm.com,m:coresight@lists.linaro.org,m:linux-perf-users@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:acme@redhat.com,m:linux-doc@vger.kernel.org,m:james.clark@linaro.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[james.clark@linaro.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[james.clark@linaro.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,arm.com:email,vger.kernel.org:from_smtp,linaro.org:mid,linaro.org:dkim,linaro.org:from_mime,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A5C1862F7B2

Testing a long sequence without branches seems like it would be better
as a decoder unit test, and this test doesn't test decoding either, so
it's not clear what bugs this is trying to catch.

The new deterministic workload has somewhat long sequences when built
unoptimized, and we can always increase them later if we want to. But
now we test that decoding always gives the same result for the same
sequence of code which we've never had before.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/coresight/deterministic.sh  | 71 ++++++++++++++++++++++
 .../tests/shell/coresight/unroll_loop_thread_10.sh | 22 -------
 2 files changed, 71 insertions(+), 22 deletions(-)

diff --git a/tools/perf/tests/shell/coresight/deterministic.sh b/tools/perf/tests/shell/coresight/deterministic.sh
new file mode 100755
index 000000000000..52e033fd6b82
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/deterministic.sh
@@ -0,0 +1,71 @@
+#!/bin/bash -e
+# Coresight deterministic workload decode (exclusive)
+
+# SPDX-License-Identifier: GPL-2.0
+
+# If Coresight is not available, skip the test
+perf list pmu | grep -q cs_etm || exit 2
+
+tmpdir=$(mktemp -d /tmp/__perf_test.coresight_deterministic.XXXXX)
+
+cleanup() {
+	rm -rf "${tmpdir}"
+	trap - EXIT TERM INT
+}
+
+trap_cleanup() {
+	cleanup
+	exit 1
+}
+trap trap_cleanup EXIT TERM INT
+
+cf="$tmpdir/ctl"
+af="$tmpdir/ack"
+mkfifo "$cf" "$af"
+
+# Start disabled and use the control FIFO to only record the workload and not
+# startup.
+perf record -o "$tmpdir/data" -e cs_etm//u -D -1 --control fifo:"$cf","$af" -- \
+	perf test --workload-ctl fifo:"$cf","$af" -w deterministic > /dev/null 2>&1
+
+perf script -i "$tmpdir/data" --itrace=i1i -F ip,srcline | \
+	grep "deterministic.c" | uniq > "$tmpdir/script" 2>/dev/null
+
+
+# Remove open brace lines as they may not be hit depending on the compiler
+sed -i \
+  -e '/deterministic.c:8$/d' \
+  -e '/deterministic.c:15$/d' \
+  -e '/deterministic.c:23$/d' \
+  "$tmpdir/script"
+
+cat > "$tmpdir/expected" << EOF
+  deterministic.c:24
+  deterministic.c:25
+  deterministic.c:26
+  deterministic.c:28
+  deterministic.c:9
+  deterministic.c:10
+  deterministic.c:11
+  deterministic.c:12
+  deterministic.c:30
+  deterministic.c:31
+  deterministic.c:32
+  deterministic.c:34
+  deterministic.c:16
+  deterministic.c:17
+  deterministic.c:18
+  deterministic.c:19
+  deterministic.c:36
+  deterministic.c:37
+EOF
+
+if ! diff -q "$tmpdir/script" "$tmpdir/expected"; then
+	echo "FAIL: line numbers don't match expected: "
+	head -n 100 "$tmpdir/script"
+	cleanup
+	exit 1
+fi
+
+cleanup
+exit 0
diff --git a/tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh b/tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh
deleted file mode 100755
index cb3e97a0a89f..000000000000
--- a/tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh
+++ /dev/null
@@ -1,22 +0,0 @@
-#!/bin/bash -e
-# CoreSight / Unroll Loop Thread 10 (exclusive)
-
-# SPDX-License-Identifier: GPL-2.0
-# Carsten Haitzler <carsten.haitzler@arm.com>, 2021
-
-TEST="unroll_loop_thread"
-
-# shellcheck source=../lib/coresight.sh
-. "$(dirname $0)"/../lib/coresight.sh
-
-ARGS="10"
-DATV="10"
-# shellcheck disable=SC2153
-DATA="$DATD/perf-$TEST-$DATV.data"
-
-perf record $PERFRECOPT -o "$DATA" "$BIN" $ARGS
-
-perf_dump_aux_verify "$DATA" 10 10 10
-
-err=$?
-exit $err

-- 
2.34.1


