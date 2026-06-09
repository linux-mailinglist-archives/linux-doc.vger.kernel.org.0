Return-Path: <linux-doc+bounces-91655-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7GYTCuYnKGrn/AIAu9opvQ
	(envelope-from <linux-doc+bounces-91655-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 16:49:10 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0FD66154D
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 16:49:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=ZVT4y7FP;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91655-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91655-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EDC39305D6A9
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 14:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63FBB3F8EB3;
	Tue,  9 Jun 2026 14:40:41 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E783AD50F
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:40:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016041; cv=none; b=tX3r7KPnCsLXMcyMtbWUIAc83RFJ8D/RzxDrvCI5LO+6AZOHlv3iXr3MLa30Q5uYagJf3SNQUj4Lgu4mz6P4RQyt8rQEIdiK/QqEgIKNOIBVhehu1L40r+ASY7keCdjUM2gaZ3VPD4mFfbY9rio1b6lTGVVWa7yUsCHMjN5FwLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016041; c=relaxed/simple;
	bh=JYW1wo5ab8agRdVZbjqrOWWaceuU0TjELaoVo7f/di4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mlNc0mtqwwiuydHQWsy8XUPmMZG+fkqME3XfQrNlJ7GJ4awSynxlPlxyER9zJ0BqE+lWBnjSAKPTjvuvp0Z49YCIWZ714B2yXndiNPr0Gro9D2SpQUbfiwj1VRKOkIldXCrXtWobZX07lv6jYii5DrMqJWViU9o7fLWV4+83My8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZVT4y7FP; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b3e03939so46938465e9.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781016038; x=1781620838; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWKqHsTkFl2zrGvjPzv1+aBtZDDjn0PHucQTDAlzntI=;
        b=ZVT4y7FPfDHwcPESuP3hgJquwGnxAiqX4Dt1NV9palWHOnWE21q88nYR3E+oOONyNw
         foHePUNCGGdsbeyrsUCEURfcJ7vEbeoIv7GTeTFiNbOgMoS2HuaYVSPCZEn79shoF8Gh
         NCcILF/OhrvpreZ1atWEYIRE7vz4BvXe2x5YhCNkxJWj5BMgcbdGyjHJ1BqPJTJozwoH
         73DXDRW/eQ2KLHM/4CpnVVOEVLWQkxE+UfzL2JnWz4LUqh6kxvP1/Xnnub29wmZFctwT
         vHZEkwA25U07RCU9Hm74ZxO2H3vAw6T7Yab2GCp7rUaTLn7SWHNg34joUhGzfT0UBiAZ
         /smw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016038; x=1781620838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AWKqHsTkFl2zrGvjPzv1+aBtZDDjn0PHucQTDAlzntI=;
        b=tOyOewWin42ZiPSIQwgrf2GXonLTWlYxOwbr9Cz0gfLiLCCkxkYQ2y6ewcYcVpE/SE
         9Sz4hpQi3yDSZT22oTmbI+9sh06/b/8syUVNZv9x00Zm7jvJAob+4c4KP4YpXBl52KWx
         O43yxyedziMog7cgXyWpsW8zdvT/t+as5qZhNUO7Xn0N7tGAzqCTLiimRV9vtLxjyYIy
         fNk083AsVz7j/nlCESenR8HlMasMoPOXVrDwc5ye5FaqryyMTrzm6GsTNa4hAbPjru3g
         afCKs5m74X7S1TQdz/itPhRlHJXJYerFOe0GqzmdpdEiXXZcK3XGGZt7bf75ida/KpCX
         EITQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vcACv3RsHvJrnb5sOaQqnUhbTYD1WUnCyveN4AgWWdNl8yYs6MZGRl8RxzzAy4j4X2gmeU3TIqx8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpgbj4N8VN6WqF16DDSMjINw45GpA8M09LRapQoZKi6DDwmuZK
	vBLUhaUnl2Roy+jCHYTBEZfqyR7RJ+D0Qgn1F3c8WnLjEvrt5pZv2ocMv9rhG2tpfeE=
X-Gm-Gg: Acq92OH1HcqRNdPz+nBUCuYCbV8V875B+FfLbJiSMOeIhZs8lLoNKHdWHyBcoz54yLc
	sHInuom0JqaHYa59uf3TURAPAgthYbpBglF7MXJX1zPt14je85eG6SM9x0FGZty9gssNfAS2piT
	HGiMDm2w/oMR8ceMM6sLxm23AyDlM1NMrApxtd5FdWA8mfLKWszA93AmgnPc4iJiGp8Pojj8WJg
	GGrn/GQ5gleA5YXTKLZnhrDNiqDR+1bPnKKVMJiN1rRXZo4Hi+/afxt8D78wj6EyIAU+Y8sEoEl
	QFnQg9kG6osblRNT1PEouBd1zAIC3AuFS8noAzXS72yo/M/VO94+F43uy8o17PBX/ma6FI0Se5z
	qKAceJFbkk0p1e/j8qfD6MTDRBHoXkHWiOfM9IM2GkzC7LNiG0rVu4QgG3PEkeUkrxfRvlhMpul
	bWIXla3AARN3Au37ii5e8hbG/Jl9VrDIaKGyeVzhIDTO4=
X-Received: by 2002:a05:600c:3588:b0:490:4b89:5372 with SMTP id 5b1f17b1804b1-490c2cf5433mr301467195e9.11.1781016037671;
        Tue, 09 Jun 2026 07:40:37 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c1149sm428411935e9.4.2026.06.09.07.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:40:37 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 09 Jun 2026 15:40:15 +0100
Subject: [PATCH v5 10/19] perf test cs-etm: Test decoding for concurrent
 threads test
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-james-cs-context-tracking-fix-v5-10-d53a7d096a19@linaro.org>
References: <20260609-james-cs-context-tracking-fix-v5-0-d53a7d096a19@linaro.org>
In-Reply-To: <20260609-james-cs-context-tracking-fix-v5-0-d53a7d096a19@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91655-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD0FD66154D

The thread_loop test only looks for context IDs in the raw trace.
There's a lot more that can go wrong when decoding these, so replace it
with a test that looks at the final output for matching thread names and
symbols.

In the future we might use timestamps and context switch events to track
threads, so looking at context IDs in the raw trace wouldn't always
work.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 .../tests/shell/coresight/concurrent_threads.sh    | 45 ++++++++++++++++++++++
 .../shell/coresight/thread_loop_check_tid_10.sh    | 23 -----------
 .../shell/coresight/thread_loop_check_tid_2.sh     | 23 -----------
 3 files changed, 45 insertions(+), 46 deletions(-)

diff --git a/tools/perf/tests/shell/coresight/concurrent_threads.sh b/tools/perf/tests/shell/coresight/concurrent_threads.sh
new file mode 100755
index 000000000000..3349fff8c767
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/concurrent_threads.sh
@@ -0,0 +1,45 @@
+#!/bin/bash -e
+# CoreSight concurrent threads (exclusive)
+
+# SPDX-License-Identifier: GPL-2.0
+
+# If CoreSight is not available, skip the test
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
+	-- perf test --record-ctl fifo:"$cf","$af" -w named_threads $nthreads 1 > /dev/null 2>&1
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


