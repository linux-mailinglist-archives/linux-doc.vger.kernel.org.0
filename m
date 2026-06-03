Return-Path: <linux-doc+bounces-90692-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1mQSB/r/H2o/twAAu9opvQ
	(envelope-from <linux-doc+bounces-90692-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 12:20:42 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D32636854
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 12:20:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=rKg0UATc;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90692-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90692-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6B383307D99D
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 10:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9B13AC0FA;
	Wed,  3 Jun 2026 10:17:40 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C55644DB95
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 10:17:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481859; cv=none; b=SD5VXFujkSb1qsV8uUAf0rQZtVwZmNrETXf0VxQH+6j3vB+pADU3/GnZV4Y9TI18HXIc1Sr5sR9glNIcatF+ZlMJ9zZAlE8usWK946ZnyYBeR5ICvRbsLR3VCrSsi1rkhmm9P4WK8siOiiFD9lCIrVeilfomyFo1x91yjj0ApZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481859; c=relaxed/simple;
	bh=+NVyoMoDiCeBbRcKsQIV0kaH0gzBxCHgeoMNyjllUrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pQupkcl7lRVGN+U8MiEhxZX4BoWt6yqtSHMhVj7uhnIJ86tKHy3dRcq/A9yf2JVP1CfO4R3VaJ0/4J4L54gzn83DOmL+2/RIkMxRHWTAVgr/Reveoz+K0sWZ6lOy5QAzJowp3CyJ/tGl2xg0MIQPbls+YelmRc6IO+pR5KOouBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rKg0UATc; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso15337705e9.3
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 03:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780481853; x=1781086653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBRnQlPosMN+k8SaoyM/0M+4oXOyWiGOMBDGTHkddk8=;
        b=rKg0UATcJ2Ntr8NWJiKo+qT1nE1mGGhEzHdTsNoelyMwxdoPtxQE5qb0LMeRLb+Esr
         1UGiCRWbzTRlvz4IFVBA+Gx6gPl8Q3AOREsjjNPR2OU05XwMGloFQV89McPVH2R+KCXJ
         nABv0SMICEGo6aTnfz1CAhQCvHjp6UQbn3CKyjxgyBo2lNEcvqJLkZYlrarkur0W0+5Y
         /0TkQ30PiZebzDgj22ezy4J9in7OdCmlEIlI9rVWeWIDloy4y7sbYjqfHR7WUFiwz31V
         JCLVFSY16yLCDSTLqDaF4fxVw9u6+ZT6oL9T+gLTKDmwTGt7tqNZG/0rv+LL/9E/VMvX
         439w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481853; x=1781086653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lBRnQlPosMN+k8SaoyM/0M+4oXOyWiGOMBDGTHkddk8=;
        b=RHaDHhI3aGca/aFJ1UU6QRs8kw6xcKVMa6hWbYxTmcK8V2xuMpXn4/RF5kUm4LoSqJ
         rcUWzZRmYH/k8s9HfQOl4TlWtBvA6gF+eW+YeK7P1GrLB5oX/cZYpTOLU2IPIAZk8n8R
         SPT537BpT0XEKa79dO/XY5oSLBmHAWBP34j5ih/gqJYAcyHDrO/W+PUnzZmKQJttnP+6
         v/doWeW/EkovQJmbAdp+dJE1DFh7M0cmNF/gPRxCwFt9FRv7ulCO2QuvTJ2pOTyg6X0a
         HsAtAPbuSAO5H25rVkbhrJ3I66HLEc9ZIwsDzTVTm91uVQ4tITztNeKA99ha5DmwCFfM
         bJJA==
X-Forwarded-Encrypted: i=1; AFNElJ99yiOhEeM59DRT6tdnlQn2knJ5MJJJnsTdumu1mM+r2w7Y6lpU5qt8T/Gn3DSqNh7GYfoSOwA3V40=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmFIjbt8qg/WnFIeESklk2Y9cAAAdjKU1gpmh2Y+9l0R9zYKAM
	r8qqGMWZWrVBrZ4ADWcBNUNHITGYaloAVB5aMwjNNgUG6Mxf3mpg0Nr5EVNNU4uJhb0=
X-Gm-Gg: Acq92OHhjvZsxhD2VOiWf7GE7JKXp0vkM3/7qBM5Uf2g12iYAPK3bL+HwGkUCnRSeKa
	4MWy35WYChEwlXES6RkgvmjbZdZ9thrfPECmLmTsHUz6Rsw8dSW+0GqvUPLNcCHymGA1jjSBsPo
	S2WAbq8Hhfi8XtiRFUDLG+hKE1KkWsCarYXfyGW+0zx6bjUjP3DTzyxEwc4C23PT+fw9zc4AXpe
	lu5kR6M33uEFFrK5m5/sUtYnivxrlFUM/GN3q+k459xw/fZOW3SZw4ZXoprrsd5lg3aokslnX08
	YR+7OfbqakoDn65w6vgSr3EQWPF/srzYDnNCkaMXbvroyT5W2oaPWF1G7XVPSenb9xk+oxQqGwu
	l60uyPpuo1DD72kVHnGqXVyyUqsQ4X4Y7F9IVjDCa7y+M3Y91WOQWdVAUtJhDFhSLEM73qEZA/c
	ZJbeF4RrVWGnaEgTvfkuY4x2+5Zp3jhdlCx4FgWvbEoGU=
X-Received: by 2002:a05:600c:3f18:b0:490:b2f2:9aac with SMTP id 5b1f17b1804b1-490b5d1a9b7mr57327915e9.0.1780481852836;
        Wed, 03 Jun 2026 03:17:32 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm38681875e9.11.2026.06.03.03.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:17:32 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 03 Jun 2026 11:17:14 +0100
Subject: [PATCH v3 10/19] perf test cs-etm: Test decoding for concurrent
 threads test
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-james-cs-context-tracking-fix-v3-10-c392945d9ed5@linaro.org>
References: <20260603-james-cs-context-tracking-fix-v3-0-c392945d9ed5@linaro.org>
In-Reply-To: <20260603-james-cs-context-tracking-fix-v3-0-c392945d9ed5@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90692-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,arm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0D32636854

The thread_loop test only looks for context IDs in the raw trace.
There's a lot more that can go wrong when decoding these, so replace it
with a test that looks at the final output for matching thread names and
symbols.

In the future we might use timestamps and context switch events to track
threads, so looking at context IDs in the raw trace wouldn't always
work.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 .../tests/shell/coresight/concurrent_threads.sh    | 45 ++++++++++++++++++++++
 .../shell/coresight/thread_loop_check_tid_10.sh    | 23 -----------
 .../shell/coresight/thread_loop_check_tid_2.sh     | 23 -----------
 3 files changed, 45 insertions(+), 46 deletions(-)

diff --git a/tools/perf/tests/shell/coresight/concurrent_threads.sh b/tools/perf/tests/shell/coresight/concurrent_threads.sh
new file mode 100755
index 000000000000..bf34d4ee77a6
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/concurrent_threads.sh
@@ -0,0 +1,45 @@
+#!/bin/bash -e
+# Coresight concurrent threads (exclusive)
+
+# SPDX-License-Identifier: GPL-2.0
+
+# If Coresight is not available, skip the test
+perf list pmu | grep -q cs_etm || exit 2
+
+tmpdir=$(mktemp -d /tmp/__perf_test.coresight_concurrent_threads.XXXXX)
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
+nthreads=10
+
+# Timestamps off to reduce trace size, start disabled and use the control FIFO
+# to only record the workload and not startup.
+perf record -o "$tmpdir/data" -e cs_etm/timestamp=0/u -D -1 --control fifo:"$cf","$af" \
+	-- perf test --workload-ctl fifo:"$cf","$af" -w named_threads $nthreads 1 > /dev/null 2>&1
+
+perf script -i "$tmpdir/data" > "$tmpdir/script" 2>/dev/null
+
+# Check all threads were traced and they have the correct thread name and symbol
+for i in $(seq 1 $nthreads); do
+	if ! grep -q "thread${i} .* named_threads_thread${i}" "$tmpdir/script"; then
+		echo "Error: thread${i} missing" >&2
+		cleanup
+		exit 1
+	fi
+done
+
+cleanup
+exit 0
diff --git a/tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh b/tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh
deleted file mode 100755
index 7f43a93a2ac2..000000000000
--- a/tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh
+++ /dev/null
@@ -1,23 +0,0 @@
-#!/bin/bash -e
-# CoreSight / Thread Loop 10 Threads - Check TID (exclusive)
-
-# SPDX-License-Identifier: GPL-2.0
-# Carsten Haitzler <carsten.haitzler@arm.com>, 2021
-
-TEST="thread_loop"
-
-# shellcheck source=../lib/coresight.sh
-. "$(dirname $0)"/../lib/coresight.sh
-
-ARGS="10 1"
-DATV="check-tid-10th"
-# shellcheck disable=SC2153
-DATA="$DATD/perf-$TEST-$DATV.data"
-STDO="$DATD/perf-$TEST-$DATV.stdout"
-
-SHOW_TID=1 perf record -s $PERFRECOPT -o "$DATA" "$BIN" $ARGS > $STDO
-
-perf_dump_aux_tid_verify "$DATA" "$STDO"
-
-err=$?
-exit $err
diff --git a/tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh b/tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh
deleted file mode 100755
index a94d2079ed06..000000000000
--- a/tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh
+++ /dev/null
@@ -1,23 +0,0 @@
-#!/bin/bash -e
-# CoreSight / Thread Loop 2 Threads - Check TID (exclusive)
-
-# SPDX-License-Identifier: GPL-2.0
-# Carsten Haitzler <carsten.haitzler@arm.com>, 2021
-
-TEST="thread_loop"
-
-# shellcheck source=../lib/coresight.sh
-. "$(dirname $0)"/../lib/coresight.sh
-
-ARGS="2 20"
-DATV="check-tid-2th"
-# shellcheck disable=SC2153
-DATA="$DATD/perf-$TEST-$DATV.data"
-STDO="$DATD/perf-$TEST-$DATV.stdout"
-
-SHOW_TID=1 perf record -s $PERFRECOPT -o "$DATA" "$BIN" $ARGS > $STDO
-
-perf_dump_aux_tid_verify "$DATA" "$STDO"
-
-err=$?
-exit $err

-- 
2.34.1


