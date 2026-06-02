Return-Path: <linux-doc+bounces-90522-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qPM0KI/sHmqxZAAAu9opvQ
	(envelope-from <linux-doc+bounces-90522-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 16:45:35 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 328CF62F6A9
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 16:45:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=RsODVOfK;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90522-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-90522-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8077A300B98B
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2026 14:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180514028DC;
	Tue,  2 Jun 2026 14:27:28 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654CF401A1E
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 14:27:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780410448; cv=none; b=aVcOtKxfGpCn7l0KyY3mBHlkZRaxziRBcOqxdOiHTYUBJOJetZ1LjIgSRp5mNi5PGy7GEphDUHB6cSzjNruEULUBxaPiTn8/CJmDlCJHFTimJrWNGclw0fWV9ZXNNgbf2sjMd+1lR3dPMU+kQu49hwBoSrT4opZtO1gtnv7GtlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780410448; c=relaxed/simple;
	bh=iQVBxA25lW6A4uA0ACC2OMef9MHB9JOIgp6xmgt6rqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EPH/qrPTnIGCTZc1XA+Nuy4kaP5Kpizyn5HY8H5XTiuFgZJeVx6TgC+AUhQv1EiqvK8XGS295ke3DrcvFGcB52wcZhTC1Vps3h9/alLpdhs3veQ0+fhpT1fAfENB6fi38KbQdBOg29+mYoZKPoxby7GV/HBJcK8lvMofG8eoOZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RsODVOfK; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so104337375e9.2
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 07:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780410445; x=1781015245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EO8/K9YxgiEJpvhD7v23MJuqc72Imxv7cQ7m/8nhtl0=;
        b=RsODVOfK7+urt0xrwfplJ6JRMaAK5fT2cft5LMm5P5iBYv3lBdzHp+hbwoet+/sBFk
         IgBMiKpc6/Eh6BlL/HPjoYIBMsd9WbomeqyNiYPFGaiEFEQHKwEtg7R0QENCjHJV4t4c
         0zqa45vYMZBPz5rTZAxcQBGIzaJOM/9AEuyVfD1q/Zk2qt1ZzgH3EwR8ONe+yfDLk/87
         HlqD//9XBhVqXV9df4UBYLKil4ujWanLPxPkgRfepylLCiZr3qBeyZIO4viuH7L3pAlg
         mj6EM0anjbmENuZ5QtH9BHLCxbgwK/yCNMOjWTGpU5VQ6g14f50akZd9izEiGpkGRaZH
         GGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780410445; x=1781015245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EO8/K9YxgiEJpvhD7v23MJuqc72Imxv7cQ7m/8nhtl0=;
        b=Tae1FCGutUfI7AV1eMq10LVZiYIE/ngkTa/ph1l0zHEwP8Cr3HaRmp8/qxdSTBsfzV
         mhZk7oxIbp+pjEDdWnxbMzfHUnI0NT3wt9attaNWvpopOBOmNZFR5mkOEui3J4g7ztRr
         R4iqOCNsG1WsW+rgnIC5mCXAOewOs5xhXKy2EJCsCZZIpqUfR8k1BsdHcMAAuwKumGTF
         qWq6DadZQ4/0BPhKutYhLUha5tv5fke5Nj1qH4Y8xdFVheTNQ8XboXjLEauvR/Hr8Pkh
         xJv/VOItqhKWFNMZy7UYkDSE8Z42Jiun+ihoC1QGjBCNPRBGrBG0Zw/pOusqm/iHBfUg
         i9mQ==
X-Forwarded-Encrypted: i=1; AFNElJ+DrMpbdzarqf+pMDCxA8kDTcwthTHU9XRPKl1g/TyR13SZu26fKXpjVQ3vzE0B+huuwMdCp1cVLTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwI5VouV+UqH2+bSEqamAnt1o48Q8QT+9A4QQK+d4AnYARVyCQ
	CT6ToCAIHik68BsURLQ0CHEp8Q4UAnNlN9/FEbkHDE/wmaZ0OvoLW9NRPvlVDLtqxIU=
X-Gm-Gg: Acq92OEQRAdpDfRBFDQbJPog7sBGMvYzRRd9HYEr+isXefH4XndwueFTx/4yf54NwHn
	RaN1dS9oEODDLugL/IYjZ/jM65bl9gQlm4rnljo6i20+VB4OLERn33jOnz4Xi83uvclk1v9lkRE
	xu09Y3OH/CK4xyBbzHlEyZLav1gapVdWfvpFThJjRI+r2jMr4zik0d1ViOesstfrFTGzzBMnMEM
	i+ZPjTtwaz3Ns8ygZiKSJuZMunaGC0XaDg6dlhQLOZJr7aB/FdfoPDje2dRhDEeSTjQhJTxpgrj
	sIxbJEZnq7lOG7I7Te+xm5328nrxZanFt/R3CrhtOz63oKMwKWnewhqm5WgQ1YsRSEBrafaFPpi
	ptxCNvlDPG/KXDmUyr/pQvompPnoI92XC7M500zcJd8Mj0ylSzY8kkxGbQXaHd5zbJZLTFysbAM
	0TgguE7i0o/YT6IqPbE8s8h/3VI2xqMBWI7lBGGm0xOOE=
X-Received: by 2002:a05:600c:4755:b0:490:3cb4:f1b3 with SMTP id 5b1f17b1804b1-490a293322dmr279955285e9.16.1780410444873;
        Tue, 02 Jun 2026 07:27:24 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e18e1csm66771965e9.4.2026.06.02.07.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:27:24 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 02 Jun 2026 15:26:46 +0100
Subject: [PATCH v2 04/18] perf test cs-etm: Test process attribution
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-james-cs-context-tracking-fix-v2-4-85b5ce6f55c6@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90522-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:from_mime,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 328CF62F6A9

Run the context switch workload on one CPU and trace it to test that
symbols are attributed to the correct process and that the attribution
changes at the exact point that the context switch happened.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 .../tests/shell/coresight/context_switch_thread.sh | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/tools/perf/tests/shell/coresight/context_switch_thread.sh b/tools/perf/tests/shell/coresight/context_switch_thread.sh
new file mode 100755
index 000000000000..0992c35a329d
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/context_switch_thread.sh
@@ -0,0 +1,69 @@
+#!/bin/bash -e
+# Coresight context switch thread attribution (exclusive)
+
+# SPDX-License-Identifier: GPL-2.0
+
+# If Coresight is not available, skip the test
+perf list pmu | grep -q cs_etm || exit 2
+
+if [ "$(id -u)" != 0 ]; then
+	# Requires root for "-C 0" in record command
+	echo "[Skip] No root permission"
+	exit 2
+fi
+
+tmpdir=$(mktemp -d /tmp/__perf_test.coresight_context_switch.XXXXX)
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
+check_samples() {
+	owner_samples=$(grep -c "proc1.*context_switch_loop_proc1" "$tmpdir/script" || true)
+	next_samples=$(grep -c "proc2.*context_switch_loop_proc2" "$tmpdir/script" || true)
+
+	if [ "$owner_samples" -eq 0 ] || [ "$next_samples" -eq 0 ]; then
+		echo "No samples found"
+		cleanup
+		exit 1
+	fi
+
+	if grep "proc2.*context_switch_loop_proc1" "$tmpdir/script"; then
+		echo "Thread1 symbol was attributed to proc2"
+		cleanup
+		exit 1
+	fi
+
+	if grep "proc1.*context_switch_loop_proc2" "$tmpdir/script"; then
+		echo "Thread2 symbol was attributed to proc1"
+		cleanup
+		exit 1
+	fi
+}
+
+cf="$tmpdir/ctl"
+af="$tmpdir/ack"
+mkfifo "$cf" "$af"
+
+# Pin to one CPU so the two threads alternate running but record into the same
+# trace buffer. Start disabled and use the control FIFO to only record the
+# workload and not startup.
+perf record -o "$tmpdir/data" -e cs_etm/timestamp=0/u -C 0 -D -1 --control fifo:"$cf","$af" -- \
+	taskset --cpu-list 0 perf test --workload-ctl fifo:"$cf","$af" \
+	-w context_switch_loop > /dev/null 2>&1
+
+# Test both instruction and branch sample generation modes.
+perf script -i "$tmpdir/data" --itrace=i4 -F comm,pid,tid,ip,sym > "$tmpdir/script" 2>/dev/null
+check_samples
+perf script -i "$tmpdir/data" --itrace=b -F comm,pid,tid,ip,sym > "$tmpdir/script" 2>/dev/null
+check_samples
+
+cleanup
+exit 0

-- 
2.34.1


