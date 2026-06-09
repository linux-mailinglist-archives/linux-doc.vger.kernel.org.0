Return-Path: <linux-doc+bounces-91638-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YnOlIIAmKGqD/AIAu9opvQ
	(envelope-from <linux-doc+bounces-91638-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 16:43:12 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5F066145C
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 16:43:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=q3AT+Snh;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91638-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91638-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C52CF317C384
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 14:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3588443900F;
	Tue,  9 Jun 2026 14:31:46 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A12243635E
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:31:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015506; cv=none; b=LywmgdGJzm9KAuWHlIOemlEE7ipz5Ut5sl+Xb85u5nLYCr8DvY7BAy5mR9/92vrEGrqLsNEhMkPsMV+V7Y+StkwFJXccWS/uSkWTRNnGHaelEj/XODhjvvK3f+d7szbMuUOIiOvaZaZzxIsQEV4QLZil1tJYpSnRkbSWA7nRWrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015506; c=relaxed/simple;
	bh=wObRJmm3gTlf7wqz3XGbcKcAk4UU+DK+eJvukw9px/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aPRQaedveqjU+FusuIi2z6Yj9JJ7cuZoQZ2iPYFdx0DGv7JvIsbB8iIyrMxWPxtzOsC2gKxAlRBEtu3nFHQXKGbG/6deXAQYC3W6G9w5+SIYObf0/puArFsQ4lqJlmPrXWu4UZnZcSUEJ/9Ii+v1CqI+qv4OZSw/d1DVJlWuwrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q3AT+Snh; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490cdae130cso15165075e9.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781015502; x=1781620302; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VdUeDLTBd8NbSbxSGmF6PVOlpVLflZ1t9lCb20G1ZuE=;
        b=q3AT+Snh4hGqs8HFEpgiBkean8HJ6dVgN7hg23oT0M/ftl4FNoANrh/p43bhuCQMfi
         v6yicTO0PYRTRtBzERpfBGqa/WzJty7+fleAzNbAhm9hrZ5y/Ubt7OG/8uiAsJQ6w4BB
         IH0Xlunw6t+mUsnauPQr4oVrBf4DT9wEvBKbyNwdrrK7k6ABEp8mryEt0wg13cviCH2Z
         1tZ7PCKQ5WFP9Ebzpllig9td8sQrsJtfOFOajHmxTVeNeaKchi5wEhU/kacwsy3xTYQ+
         tgZgrumVN9ug0SkEw8X8s8RAE9HTkuvGCNYfbXuXpPeLWVZcu5ZyFL0ORIPkKnzqFeok
         Beqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015502; x=1781620302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VdUeDLTBd8NbSbxSGmF6PVOlpVLflZ1t9lCb20G1ZuE=;
        b=iUM6P8OPI+Vy5zv4CV2avY5x8CKfyraMuFcg75vVtyOQ0a3XOZ7Nqrip5zmt7NBolS
         gBPuzpOCVgEBzB5dfxfEYPM0o3JSUp0NtBRfWVmaTEpsRAxdKTGSySu1OJDkpk6X2oWw
         VH/c8bUFy2uodg6s2X+XVQRsbALYEN6zrCYxOp7ZkhIuUhxWj65W7blxqzry36LJD1y3
         wcxhOBxZH0Ed1lzeQmbjnLJ56nT7CdIlbFrOFvlcIvPH2ko9GiA1rwjXj6vcd31dfWzk
         o+8PzEXZ/oYBCaPoNCCBugQJNGRSVMQ2b5D9Yfp+XIc09OkCsCgocuYFKRQbD0hMlOQq
         /fPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9vSov3dVVgPzUlU1JgCbAKb3qMy5Ve9oELnFxE+aN0O3XXo1cneGQOOIU8d0H4SxJ0Gdu8AkTQC00=@vger.kernel.org
X-Gm-Message-State: AOJu0YzACS1/ccEY7aMa79J9DxPvGYLBiKbYzed6HdoceFpjR3lkJxPL
	xuvas02TrHqhbvTkY4AdEejWRsdWSaQ3D7yrfI3W8XC6g7c3QCRI5TQno5vVnrQGxX+6I4mrvSY
	fXg4Wdgo=
X-Gm-Gg: Acq92OHkxhYjpMM2NsPfg04YlkIsQIHWrF5R5LmAN6/D/JPYOStbLvS6+aQ3iYiPrsN
	nEuoWZwQHJG33UP2Yg1Yfsawoke3wEe8o04i+uw7uMhdqqgTWGW7PkWh5N1x1xgPtDQiKvNAinW
	4tPLRRvrwbfOT2v6xz1Fhs/3+qNi2MA0V+u4l7ulDozKYWeFCCxsmkApfi4SZljvUT0rZB75Bq/
	6loNyye3IYTVAkRjsmhVe3BjxvVXNjvSIxeTetmh2VeINTRF4/tVYKlnUk3XWBK7q1K+LaMeMOI
	syoLvfd6vIVr1lrYb04u0eStJ0ta0PISB1MuirugY74w50J6ev8t+ruTkBVw+321IZBtU3O6Hy+
	OftuYLrwxXQk8kyVhfLTR0O5L9uw1UflzeTIr9m1Jt4CZeOaknR+mJnFqzDP0PWOoiRvYJ0oGxy
	TJhv7si+YIfES1tBD8hZLt+xSIgNzMBlyjITvj3v9bsaM=
X-Received: by 2002:a05:600c:5488:b0:490:9d1b:f07f with SMTP id 5b1f17b1804b1-490c25b1277mr393849115e9.12.1781015502478;
        Tue, 09 Jun 2026 07:31:42 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm62738388f8f.20.2026.06.09.07.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:31:41 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 09 Jun 2026 15:31:10 +0100
Subject: [PATCH v4 17/19] perf test cs-etm: Add all branch instructions to
 test
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-james-cs-context-tracking-fix-v4-17-44f9fb9e5c42@linaro.org>
References: <20260609-james-cs-context-tracking-fix-v4-0-44f9fb9e5c42@linaro.org>
In-Reply-To: <20260609-james-cs-context-tracking-fix-v4-0-44f9fb9e5c42@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91638-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,arm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B5F066145C

If we reduce the number of samples searched to speed up the test, then
there will be less chance of hitting one of these branches. Extend the
regex to cover all branches so the test will always pass.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/test_arm_coresight_disasm.sh | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tools/perf/tests/shell/test_arm_coresight_disasm.sh b/tools/perf/tests/shell/test_arm_coresight_disasm.sh
index 87797d239f76..f78dfb6bf73e 100755
--- a/tools/perf/tests/shell/test_arm_coresight_disasm.sh
+++ b/tools/perf/tests/shell/test_arm_coresight_disasm.sh
@@ -38,8 +38,7 @@ cleanup_files()
 trap cleanup_files EXIT TERM INT
 
 # Ranges start and end on branches, so check for some likely branch instructions
-sep="\s\|\s"
-branch_search="\sbl${sep}b${sep}b.ne${sep}b.eq${sep}cbz\s"
+branch_search='[[:space:]](bl|b(\.(eq|ne|cs|cc|mi|pl|vs|vc|hi|ls|ge|lt|gt|le|al))?|br|blr|ret|cbz|cbnz|tbz|tbnz|svc|eret)([[:space:]]|$)'
 
 ## Test kernel ##
 if [ "$(id -u)" == 0 ] && [ -e /proc/kcore ]; then
@@ -47,7 +46,7 @@ if [ "$(id -u)" == 0 ] && [ -e /proc/kcore ]; then
 	perf record -o ${perfdata} -e cs_etm//k --kcore -- touch $file > /dev/null 2>&1
 	perf script -i ${perfdata} -s python:${script_path} -- \
 		-d --stop-sample=30 -k ${perfdata}/kcore_dir/kcore 2> /dev/null > ${file}
-	grep -q -e ${branch_search} ${file}
+	grep -q -E ${branch_search} ${file}
 	echo "Found kernel branches"
 else
 	# Root and kcore are required for correct kernel decode due to runtime code patching
@@ -59,7 +58,7 @@ echo "Testing userspace disassembly"
 perf record -o ${perfdata} -e cs_etm//u -- touch $file > /dev/null 2>&1
 perf script -i ${perfdata} -s python:${script_path} -- \
 	-d --stop-sample=30 2> /dev/null > ${file}
-grep -q -e ${branch_search} ${file}
+grep -q -E ${branch_search} ${file}
 echo "Found userspace branches"
 
 glb_err=0

-- 
2.34.1


