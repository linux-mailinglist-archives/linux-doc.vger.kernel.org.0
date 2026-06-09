Return-Path: <linux-doc+bounces-91659-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f4lyBtopKGpk/QIAu9opvQ
	(envelope-from <linux-doc+bounces-91659-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 16:57:30 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB53E66169E
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 16:57:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=z53EiAEP;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91659-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91659-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 91D65307B36C
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 14:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A83D142B753;
	Tue,  9 Jun 2026 14:40:46 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B546342DFE6
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:40:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016046; cv=none; b=SgrWMp6YTB8hpHWbRt8VBHIfThf1L1WzKSK++1ozDLgLYzIQ0YxPa0iuvkF3sEwbNl58nenf8FpaNEkZ7MYs/coGfEvCf//F4IuAYCypL1zHbTRRGwIuFfUihzNxJhw6S6eqvXskgacyweP56Sb+cCvJ/e/uv89DK3O3VThyU/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016046; c=relaxed/simple;
	bh=FSMtqVRVy7D3pvypIs3gLf7OFxrFfmQrY4e2IbRbIqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dv41qiX6Cul8Zt6RpjhGftZ4OwXAfADSE98sNa+E6+2SE5VdzOXiq3rxEzLB8hDbrC+wV5FnAZIIYkNmcGcBKzBzIY1V2XrNoQvXg7SemVT+GWRrvv87m3jk3Xoyriu0Ftt1FblKG2IErsVgM6GMIqwAHQR+1PbdCQwqT6+lLl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z53EiAEP; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45efb698ef2so2688835f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781016043; x=1781620843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ng7BXZAmfD6H6DnpoBma7BIsuVaWOeOAye3IPeJCbwg=;
        b=z53EiAEP14qyNAbzHYVk4LMZC23WNrFWujlu8v/9L+pEXX31BIN72EBlrDudaAOimC
         sig/ouiNGs8JU5BPUJAaLWaEUQzVCtICMR0fzHfjYoJRwApxVAqFChL9fci24TeDQJUs
         bG+dYAKniHeJPQxN8TLxTs5Eu2kTBgLGUBvvWpOC6vc1QTLwocihA7YGzY/SNpRDcDNz
         7sf+0DI2c7Wl0U9T03nQXovT7TzMIS6wdtphcN+nQZqxFQO1q+R05Ac3Sx/zZLrniPX2
         daZB5gnqUfxGNLyBQV6YGYTGnBd5b5cdxHeFKqE+ZM+fnxoUHthxsgTW8oF2U0lF3Thc
         YtYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016043; x=1781620843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ng7BXZAmfD6H6DnpoBma7BIsuVaWOeOAye3IPeJCbwg=;
        b=iQ+/QC8iHSjZnTvzpc0I7r+FZ+56s3aRZw29y9OkKtm0QGRibwGmv3wMPb3gk40az/
         d9WEXM7ovd45yWHB5EQp+48o+CNjsaAGa5vE3pmcljvnxXNFweZYQbdu7WaogCuqDgWr
         R9oOvxgkybNhhvUjShAWMPLGaiSFt2QQKi6U5dKRpeDpZlenoL3hcC5figULlOnbBE9e
         Bz445JtdFwzXa0ODQZ+NjN2tlno9PaDC9GW+AruGGjzCMvBMGDwdWWWuquO3ltuM/hbd
         zm8ADHXF0pGMhc9XhOxKgcLmbqCSo5zLnU74k9Rcq6VymFgOlUw5e0iyrUPwhGAZgvox
         GEjw==
X-Forwarded-Encrypted: i=1; AFNElJ9o9rAMW5C8wtTyHcxg++02n55IPJarQhYnwqB9YEPt6SspRPfcIejr/8Di3QVNTJHDcxCW0dtOJsA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYyupWjOfuvc1aoT0mmCSVJ122/4QUYwWs7rS0Q3yxOHVSgROU
	VBFJiZoaJQeNEikUxLMkIQ/9vsY3JjK+TmzWPAANzgDms9nZeBm+0qxJJok6gm2b2IY=
X-Gm-Gg: Acq92OG1Xn38a14A8uGW1NqUNd7kW4vr5NmSpVC5nmmHQ5yioITgvw4JIox/DxkLBFZ
	7T1bu6gp0K/KVfP0kiaRW38jkHDD/A1SXU/7ZZetID00NylYlREzg6johFQBQfw1qAj96LFi1gy
	C2w27H1czf6m4i9HnSSa6cM1FCWV3FWGL0MVxWSlygXs1QAb1RM+Hk9+1u6Nhy6EpVfiVANG6Mt
	EBka0leoXY+Dup9d/jOizm6ID1ykNMzywIPKMOeRejHf4uFsQYDWs8iV+ezI+jFMuv3NnmWalg9
	VTwsQo/tN/KiwlKeVBhA9W1dJeK+6pbSNopdAu33UUjvFVWzIa+pak7IQwaq0xJ4/ZTsyYx7BMh
	q4VdMqAYpW4/7iO112HkOr2jquaV79ucAVH0ZHno5ykirQJfvuKP4S0/gmDBPQU//BMdzHftUev
	q6WFDWK8HYtnNAc73aD4wqjvnZfEeODxdTKb4vP//88AA=
X-Received: by 2002:a05:600c:8b0d:b0:490:b9ce:a73c with SMTP id 5b1f17b1804b1-490c55662b1mr334065995e9.31.1781016043268;
        Tue, 09 Jun 2026 07:40:43 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c1149sm428411935e9.4.2026.06.09.07.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:40:42 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 09 Jun 2026 15:40:19 +0100
Subject: [PATCH v5 14/19] perf test cs-etm: Speed up basic test
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-james-cs-context-tracking-fix-v5-14-d53a7d096a19@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91659-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,arm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB53E66169E

Like the name says, this should be the most basic test possible. Kernel
recording is slow and already has coverage on the systemwide test. Perf
report output also has coverage elsewhere. 'ls' also produces more trace
than 'true'.

We only want to test if the combination of recording options works at
all, so fix all of these things to make it as fast as possible.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/test_arm_coresight.sh | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/tools/perf/tests/shell/test_arm_coresight.sh b/tools/perf/tests/shell/test_arm_coresight.sh
index da2f599393e2..83295a8fe179 100755
--- a/tools/perf/tests/shell/test_arm_coresight.sh
+++ b/tools/perf/tests/shell/test_arm_coresight.sh
@@ -179,10 +179,9 @@ arm_cs_etm_snapshot_test() {
 
 arm_cs_etm_basic_test() {
 	echo "Recording trace with '$*'"
-	perf record -o ${perfdata} "$@" -m,8M -- ls > /dev/null 2>&1
+	perf record -o ${perfdata} "$@" -- true > /dev/null 2>&1
 
-	perf_script_branch_samples ls &&
-	perf_report_instruction_samples ls
+	perf_script_branch_samples true
 
 	err=$?
 	arm_cs_report "CoreSight basic testing with '$*'" $err
@@ -246,12 +245,12 @@ arm_cs_etm_snapshot_test
 
 # Test all combinations of per-thread, system-wide and normal mode with
 # and without timestamps
-arm_cs_etm_basic_test -e cs_etm/timestamp=0/ --per-thread
-arm_cs_etm_basic_test -e cs_etm/timestamp=1/ --per-thread
-arm_cs_etm_basic_test -e cs_etm/timestamp=0/ -a
-arm_cs_etm_basic_test -e cs_etm/timestamp=1/ -a
-arm_cs_etm_basic_test -e cs_etm/timestamp=0/
-arm_cs_etm_basic_test -e cs_etm/timestamp=1/
+arm_cs_etm_basic_test -e cs_etm/timestamp=0/u --per-thread
+arm_cs_etm_basic_test -e cs_etm/timestamp=1/u --per-thread
+arm_cs_etm_basic_test -e cs_etm/timestamp=0/u -a
+arm_cs_etm_basic_test -e cs_etm/timestamp=1/u -a
+arm_cs_etm_basic_test -e cs_etm/timestamp=0/u
+arm_cs_etm_basic_test -e cs_etm/timestamp=1/u
 
 arm_cs_etm_sparse_cpus_test
 

-- 
2.34.1


