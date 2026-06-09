Return-Path: <linux-doc+bounces-91640-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vHpVD9soKGop/QIAu9opvQ
	(envelope-from <linux-doc+bounces-91640-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 16:53:15 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D707B6615F4
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 16:53:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=rPVsdbSl;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91640-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91640-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58C9E3186835
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 14:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B96DB43C04A;
	Tue,  9 Jun 2026 14:31:48 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC9043C05C
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:31:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015508; cv=none; b=DgBAO2rG+kevGYlKHEVwzLlAXFXw47Gku4ciVDeDe5sC5GTWQGADEKEAlUOO60N08nglAKT7GC+JxTdtDosIso1z/6kXN8WkJhfvzAciURflqVSaOhRD+hnRDq49f2FPb2kIRRr7vQMDUzVmomdrk1YBDZqfDat/NYPtCZxMNQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015508; c=relaxed/simple;
	bh=6om1sNi+g28w6gz9Rvlzv8I2HBpgV5uEGqJP16w3z5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bhVMh9VHPKkOtfMO+ASNq0YZ4XXxl9fsknyCtPXfKJrmvRndR0Lhz9RJ96dCHF20MqK/m+cK/v4z2WwpGf3NfAC96ofsqMnvF26EBLj70d8ebURoa5OdQhy/YoZITleuPZCZzpcyWwgRpVIiJ+yeLT6uCoCjApWA5RBfEpJiX2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rPVsdbSl; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso44466725e9.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781015505; x=1781620305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gf9ynHBKvgH06k0u+j7iXyYQLRwSGMTUy1wnSW+2ToM=;
        b=rPVsdbSlordoDzz4dJC0m/hS9iHu0YT1qIwqFNELm5et07sTg9ned4voIE+qWCwk35
         33Rkj59Hl7RX95gWU617Ot6zgAl6M+sIUCurWKDG3uZgtDvgBDs4wJ70mrzsEv/wkC8L
         tXUpXOwenRaNkUFoQClN8hC3krWACRlBAQMMg3K0yAMmA6EmL7waPMFlBxkC5fyEjst+
         YHLcGcMnvZs1/gZpAuw53qGUfrL+g3xpEufPsd3/kYzk21RuRmqFNztIwDSBggGjUX5H
         BpjouZRKtsvFYF15EG6Z5KwVV/vceT5DP+jqj+giWCFoAU/ThPcNBF5POZTW8PafV/9A
         vjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015505; x=1781620305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gf9ynHBKvgH06k0u+j7iXyYQLRwSGMTUy1wnSW+2ToM=;
        b=bNhT5NklB6r8No3t6qSrrhBRrzuc6NfzayZRXPdj4usj21sxJs35XZA8Cwnk4MTM9j
         OM0O2fWlqQ/2vQOIfVE91AO4yhyyeQTAFJbZlqfB48eGOsu6QhidlElyjQCAmN2Cy0r0
         EY0bIf9offTTImi/wSxExvlmaLBtzeit8yA1Vas60dXHWLzPjPckMrGtUAYqmcQ9v5Mx
         zCGwcAn7aM9aUepDFVc3I3+CIKcMYynU/8ERhWob1v1Iz6H3ztOx+QXTZFui6H68e+tu
         tQcVBoJvxjgvUeNsXPER+GV/TNbHVa4U/RPeq78RnBZCbocwFa8AgcXzDx+AL6DktDhg
         15aw==
X-Forwarded-Encrypted: i=1; AFNElJ8DzX0pcGmc/bd3Js4qkY23sCe2iuNIHxaDb/msNlmo0FHbWSrCJ3KOst6YVd9hr31uC4f+slzv3Gs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIainqEVXYwlFhDojQMCdT4+5Oyd8mj2fPboXkpV3/r93ZD9rG
	QbV6kselpNZFAkFhRpd+PoHclWWmTw3wG6GYy6vsmGxILg+i0o5vuPRgXdaI3gjiUEPAe6Q1jK4
	uXQmq1ho=
X-Gm-Gg: Acq92OH44t2BahAT6zb5odw+3ErWISvMf7IzXpHEtjr7xRFprhI/1mzaNVBO6etsxIB
	p68tOWxDD5CCPInzwLU23KcTvktSvwurkxCOsGH6PH3E2Uq6vrqh5N5yULqzf9+/5qEAsv33q3x
	9W6JGnYB5ryP/J7kycORILvpxADOYQ/8Rp4lSpsGcZkt4MRC7nLYZ39Q8910XoPPyXa35GoY8zz
	Ob9Uejby53Xh7eDaFJGsGyrLT9ZzktOkFJNAhx9mmGULoro1UiOn0NtcOz0DMrzCRtgfGjffQYl
	2HcAce9zpXe2MFZLFWYijWypdx6gT7NxRrFhX2Xj5PpasWyjAiGd2DFQJc7y0am7sZLWg1U56gY
	rVqotYTPBpGqaUEcNep1sQ85D7N6OCuNnpR1N1zPbpwCWGGhHEbHfCKwdxv0izU5aJtWDgtuKDu
	sgaOzdgEQgew52C88gaW+7hf+QpaNQoXT84UuM7PgcfpY=
X-Received: by 2002:a05:600d:15a:20b0:490:b58f:4d65 with SMTP id 5b1f17b1804b1-490c2d1fbefmr199528435e9.15.1781015505479;
        Tue, 09 Jun 2026 07:31:45 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm62738388f8f.20.2026.06.09.07.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:31:44 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 09 Jun 2026 15:31:12 +0100
Subject: [PATCH v4 19/19] perf test cs-etm: Move existing tests to
 coresight folder
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-james-cs-context-tracking-fix-v4-19-44f9fb9e5c42@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91640-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp,arm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D707B6615F4

There is a subfolder for Coresight tests so might as well keep them all
in here.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 MAINTAINERS                                                         | 1 -
 tools/perf/tests/shell/{ => coresight}/test_arm_coresight.sh        | 0
 tools/perf/tests/shell/{ => coresight}/test_arm_coresight_disasm.sh | 2 +-
 3 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7efb893edcbb..ff8935b459ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2749,7 +2749,6 @@ F:	tools/perf/arch/arm/util/auxtrace.c
 F:	tools/perf/arch/arm/util/cs-etm.c
 F:	tools/perf/arch/arm/util/cs-etm.h
 F:	tools/perf/arch/arm/util/pmu.c
-F:	tools/perf/tests/shell/*coresight*
 F:	tools/perf/tests/shell/coresight/*
 F:	tools/perf/util/cs-etm-decoder/*
 F:	tools/perf/util/cs-etm.*
diff --git a/tools/perf/tests/shell/test_arm_coresight.sh b/tools/perf/tests/shell/coresight/test_arm_coresight.sh
similarity index 100%
rename from tools/perf/tests/shell/test_arm_coresight.sh
rename to tools/perf/tests/shell/coresight/test_arm_coresight.sh
diff --git a/tools/perf/tests/shell/test_arm_coresight_disasm.sh b/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh
similarity index 96%
rename from tools/perf/tests/shell/test_arm_coresight_disasm.sh
rename to tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh
index f2fb1aa92252..ccb90dda2475 100755
--- a/tools/perf/tests/shell/test_arm_coresight_disasm.sh
+++ b/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh
@@ -24,7 +24,7 @@ perfdata_dir=$(mktemp -d /tmp/__perf_test.perf.data.XXXXX)
 perfdata=${perfdata_dir}/perf.data
 file=$(mktemp /tmp/temporary_file.XXXXX)
 # Relative path works whether it's installed or running from repo
-script_path=$(dirname "$0")/../../scripts/python/arm-cs-trace-disasm.py
+script_path=$(dirname "$0")/../../../scripts/python/arm-cs-trace-disasm.py
 
 cleanup_files()
 {

-- 
2.34.1


