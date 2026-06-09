Return-Path: <linux-doc+bounces-91652-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tVohNsMoKGof/QIAu9opvQ
	(envelope-from <linux-doc+bounces-91652-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 16:52:51 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1596615DE
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 16:52:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="rq/UcUXO";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91652-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-91652-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F36E5310FF0A
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 14:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0931235E1CB;
	Tue,  9 Jun 2026 14:40:37 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3088635AC13
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:40:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016036; cv=none; b=abMF1fxKrMW/1CX91miCkrBC1rJKCA55BokzfW9RXLWZADu/AQbp7PGdSJ3b4tHu3l7zZ2Y2tN/EZmqmwGHccDxyJpWhVXjM+AvQqFr8JosOO7kiochtv9ImXeFL38HTSa9B70zOxm2Eo8HZJ4GM7GGDZEyEvscp6tL1levMWQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016036; c=relaxed/simple;
	bh=eCuV3FuofxqoEQPMj2FadVdPVNUg7XcieFIZyThEq0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hgr4exQihowhVkM28DClixTmnPFY5gZDK/xlSYKGDnEzXQ1xhf7Bq7nVVpYT7TQpdVW1DnWYY0NJk+l/3x3Z+AvUQL3DtfdOBYdZhZREOXLGpKcd8VZGPpveKevZWHpVhrMEkOWECMgqYVEtTMiy6TL2bHHGBuJz95n12IMPltM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rq/UcUXO; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so71965225e9.2
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781016034; x=1781620834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bSy6i0DRlOr9w5Y09gyckl4fi8MxME+0ZH/anot9Owo=;
        b=rq/UcUXO4nWLSNTgoH8rIYdH51RW0+hrLuUykp6wNs/1xt2qN1xISNzaIrIalJJBV9
         dZQMV9ofjJGcDujI1r+Tcj/zHnWFd5igk2kSimX5GFZK00eqNk4QVewzEufBHqQ8dEMf
         oQsWAz3aK2dnNwjKetucX6WS0hbghcFp9v8q7s8tc9eb0CF/+AOw2n8S2N+CJNlWeC/6
         e2TaqtD+jNTqfO/DkCwr4Shw3bdsK+JK/snx12OklIHTFwmdtnrWc0CT5dTlQ/1HrjS8
         EMZSs217nljZrzMh3BP16zrVWP0H01v0wzEOpMXguvX61qUO91umM5kVcAJQVf0I2OZz
         PsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016034; x=1781620834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bSy6i0DRlOr9w5Y09gyckl4fi8MxME+0ZH/anot9Owo=;
        b=BB1kTnWinkw313E2CY43NAzXAEfUpcybVGGHnSfYdtjzunAV3PLzsrwpN16MRBoUNe
         uwL+hz4U6ppiG7a1eiR5sPIySm+QJcG+GctSDLwrlAG2cIdZT9qqvjgeUEuJ+vkMOFkW
         DDdP/NGcg6A7cdPEPtZ2uOnenSsTxCmJM10JlVO4Qf6TIRD9uCjUY9D8Gyeg67AKTxjM
         xsvqUUDmseef3epUR7Qku7Ia2S0Z909/P+6ASWBswZ4v5oi5aFdQ8EijT8fHkFusKwnf
         x/MVJp3ZKs90BO7UO90M/m56lUilvP3bWBTLaUwrANUiwfhJZWo46oBukymiBd1tQzwX
         MKaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8TP275ayjP9PaNc3LrNvLhddjVo/CohLlTs/QUG8LTOL/RmhZ604Q++rsWMv6vT6lPJs/cc6px4HY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh4G/IugzB7MbtaV5Jk0lxzlVblzjlL1Phmn57qNqZzNf9pS6+
	nKWHHFp3ia+5RGNbXR1WCkJjk44FmFUbNZOrBMHFwXGznNE6uy7RZuqCmOyTCDhgljQ=
X-Gm-Gg: Acq92OGmKe7fEszGSTxt1/nL5vwATwNHTZR9rBDI3JIA0u7t/GM4bvYpCNUS7gIVFr9
	s5fBIDXfOd7VQsBzSZnMrr8/y/3F+LKVenOxeAYhjQAedDHR/P6lDT8bXijROa5E7w2D7ze8Ht/
	6YyuYMePZrZuqqNb/cNlLSERM5D3sudAyE18u8aoNaJyyjU2M8+Ale4/DQ1Am8vJ7HQ5BVRlFQd
	mrlf0NccOBV2Vg+EJCWKHzajLzssX8uIn//VN5zO7fSh3WN3fUmTcmm4nIFZ4NUAMaj8qfBNqtx
	vmzCGedmTI3BlMWflNq9w7QQvVgCcuJYIR6/XWakwXx36UAaa/OH2zQoeJJ0icqY4FnNvAZCnfL
	fyKJ/ui2JVSdbIIvJeBpgG2/gWe8dI6mEsD5SNGrI1xHJov+CmXhadULAx8EcCB7mK1yHb8Vvjf
	Wwjw5JDoCFirgNp90VdU5pB9EQZa+KWTkbfG0wi4sklrk=
X-Received: by 2002:a05:600c:8b70:b0:490:ae94:a7e6 with SMTP id 5b1f17b1804b1-490c25c20e0mr322707135e9.24.1781016033565;
        Tue, 09 Jun 2026 07:40:33 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c1149sm428411935e9.4.2026.06.09.07.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:40:32 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 09 Jun 2026 15:40:12 +0100
Subject: [PATCH v5 07/19] perf test cs-etm: Remove asm_pure_loop test
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-james-cs-context-tracking-fix-v5-7-d53a7d096a19@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91652-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,arm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A1596615DE

It's not obvious what this test is for so remove it. It's not a stress
test because it doesn't output lots of data and it's not a functional
test because it only looks for raw trace output. It seems to imply that
a program written in assembly influences whether trace would be
generated by the CPU or not, but the CPU doesn't know what language the
program is written in.

We already have lots of Coresight tests that test the full pipeline
including decoding, and in many more modes of operation than this one,
so if no trace was collected they will already fail leaving this one
redundant.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/coresight/asm_pure_loop.sh | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/tools/perf/tests/shell/coresight/asm_pure_loop.sh b/tools/perf/tests/shell/coresight/asm_pure_loop.sh
deleted file mode 100755
index 0301904b9637..000000000000
--- a/tools/perf/tests/shell/coresight/asm_pure_loop.sh
+++ /dev/null
@@ -1,22 +0,0 @@
-#!/bin/bash -e
-# CoreSight / ASM Pure Loop (exclusive)
-
-# SPDX-License-Identifier: GPL-2.0
-# Carsten Haitzler <carsten.haitzler@arm.com>, 2021
-
-TEST="asm_pure_loop"
-
-# shellcheck source=../lib/coresight.sh
-. "$(dirname $0)"/../lib/coresight.sh
-
-ARGS=""
-DATV="out"
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


