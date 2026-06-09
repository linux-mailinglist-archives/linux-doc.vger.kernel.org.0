Return-Path: <linux-doc+bounces-91657-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yA1MC94oKGoq/QIAu9opvQ
	(envelope-from <linux-doc+bounces-91657-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 16:53:18 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B276615FA
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 16:53:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=n3ClWf57;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91657-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-91657-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7EFD4309ECFC
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 14:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0C2421F12;
	Tue,  9 Jun 2026 14:40:43 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC80E3FC5C2
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:40:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016043; cv=none; b=BNgVJNAQoRrXtwvqhdaiRhaG7IvcPDNmFDsQGh5B9iFnMV7ODW/pn2NgEcIonWSnPRhujuG6ezvcVoqWTu6a6Y+dnURWKxwomKUTECVCoeloa9EaFve2Jw29bUiiIHV7y8duDPIvvrnOsTyPkYcdfkEUyGFLnQZNpqtKZLuiuYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016043; c=relaxed/simple;
	bh=mQidedvPEcBiOBRv8PmX5mxZNEPoVdc1Pz6VHmtCWcY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NDpMMwFIkCIC01ScdFDulXg/EU98F9LE/SD0FYsnNcLWrJZrGG10chVw6j4UmDhIb2ALMxA8VEoZ+rsm1CPiFs3oyC9pTLSqVhqOh8NokD7eqkgTStscc5F5F08wVEf3p5fGdp5impX2Pn/Ak9cO/Jrjki4JoJB4gWQ8A286HNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n3ClWf57; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b3e03939so46938945e9.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781016040; x=1781620840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0r3qOldyDbGy8/U7IZ1oQnEHZB4wfLaYDHPrqBV1zp0=;
        b=n3ClWf57sd5PkLtEZktzo7G7Ha3uasTL9ORuakvy7SlhxFphoGFmEHhVdkT6F3/NFk
         9HWTCh+Lb6AqfYU6OlNvQEYRrNl53croXyykBfwjldoXRp3zXbJr2Tmi+wKdamqUgiFz
         1FPyzgDPcKqJMmIaXpL4BgkZbmhZPYSpCrpp9oqhrwLtcNdnPAg5JDLgdDI4hcJMszUB
         OnX5LyDD0+HPlyWC/A+cRYhJpfvlWet99GGL6vOqxQnmRd8xRyJK4MQrIVYov9N22vVS
         EITnEBdlH5hxiDZ1QvW0eBhSLQoItoALlR1ZVkXe3DCcMIYzpV9NgSrHxoN8DTwmk6gT
         8Skg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016040; x=1781620840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0r3qOldyDbGy8/U7IZ1oQnEHZB4wfLaYDHPrqBV1zp0=;
        b=Qgp7mT2D4jmvXEYAiwwUa+ra1xAYDwjsN0K5inmMDaFBT8gvjAiT57oL4DzlKJ0GbQ
         IbKoa9qAJczrAu1pmvPtyFpOkXLGzudPxb9HuVM+EUiwy1BAhZ8e5HR/UIsL4cFLn+An
         VbMFMdj49P01mNg9MG8vsGo3gssWKPaCRHxT+UzgfO2NXzHPKS8ZYugo33ruqZq2kxpD
         JBkRYbodjaNgLEsBPCa6taTMQHEFK3fFl9RyV6AyXSUeMeqY8TpuH6r4H8IRrxtztzI9
         IziQntXNilPBvTbBhDmXdXxiT6Kht2J7nEaKen294t1mR6+xzME+Kg3lPBZ5vWujbD9B
         8/Jw==
X-Forwarded-Encrypted: i=1; AFNElJ9R1EE++tYlUmBVLN1Nvd/8VFxOmiAW0sYmdXqwhyQlWx3BvNBysxwUE+lN5DL9HR60nDV6D1MmhzI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRh+Zkvo+gkuhbyMSNrWBDg4iR5DPTBEUm9gQ7DL7epHMZhvVw
	rdrcJGnT1nuAuWWnHAqkgfCiyU4qntTiVacgYycAA15eMiWTKeTEoiCY5wLT3RptXuA=
X-Gm-Gg: Acq92OHMb0z6C/B2eXaePeNKfpJ4QGek+PprKo1RMB6ba5XEq3f1EEYD2LdtDqQomZ+
	S0XqW2zCQhUJRSvDMou3DtOkWRatBCrX9bJXu1D4tnM6n8jlLxj23nb3G3U9skm3k8xKDeky7DC
	OCywDrSYyc7EzocOcmmwTbpLxW988n8ik5ANvP+WyNJI3OT24Mr/1GM9km8MDx417yAKxD/H00r
	xZ6W7NqiMox5gh+V2wVu0prhPArEbkWIKVTtiDXuag0KK/umYpMZXLsC++ezKX5xnYXrr3OsEJu
	wd6YTahRjhYtPVqOOOHeN7UGxm9PjPzMzc+fLNn3qj6K5gfDjLTKrjgkYONxhsqzwwon9ap+s6e
	FGiiqlk9jqhJ7zC4DojiBBOhkk8ohqMVjMToGWLDRWym4BiHaIts7jbKhAwE2ClIpiOwKy5V9zr
	PNtTCUCyI2A1Ra3cS+ifF1Z/WZUeN7LX6OCr+kouPPmFo=
X-Received: by 2002:a05:600c:8519:b0:490:3cf0:8d81 with SMTP id 5b1f17b1804b1-490c2d0e9a2mr256116745e9.13.1781016040481;
        Tue, 09 Jun 2026 07:40:40 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c1149sm428411935e9.4.2026.06.09.07.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:40:39 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 09 Jun 2026 15:40:17 +0100
Subject: [PATCH v5 12/19] perf test cs-etm: Skip if not root
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-james-cs-context-tracking-fix-v5-12-d53a7d096a19@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-91657-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 11B276615FA

Use the common idiom for skipping tests if not running as root, which is
required for these tests.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/test_arm_coresight.sh        | 6 ++++++
 tools/perf/tests/shell/test_arm_coresight_disasm.sh | 6 +++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/tools/perf/tests/shell/test_arm_coresight.sh b/tools/perf/tests/shell/test_arm_coresight.sh
index 39553702c1f3..8ed2c934c87d 100755
--- a/tools/perf/tests/shell/test_arm_coresight.sh
+++ b/tools/perf/tests/shell/test_arm_coresight.sh
@@ -20,6 +20,12 @@ skip_if_no_cs_etm_event() {
 
 skip_if_no_cs_etm_event || exit 2
 
+if [ "$(id -u)" != 0 ]; then
+	# Requires root for -C and system wide tests
+	echo "[Skip] No root permission"
+	exit 2
+fi
+
 perfdata=$(mktemp /tmp/__perf_test.perf.data.XXXXX)
 file=$(mktemp /tmp/temporary_file.XXXXX)
 
diff --git a/tools/perf/tests/shell/test_arm_coresight_disasm.sh b/tools/perf/tests/shell/test_arm_coresight_disasm.sh
index 0dfb4fadf531..339ae4831868 100755
--- a/tools/perf/tests/shell/test_arm_coresight_disasm.sh
+++ b/tools/perf/tests/shell/test_arm_coresight_disasm.sh
@@ -42,7 +42,7 @@ sep="\s\|\s"
 branch_search="\sbl${sep}b${sep}b.ne${sep}b.eq${sep}cbz\s"
 
 ## Test kernel ##
-if [ -e /proc/kcore ]; then
+if [ "$(id -u)" == 0 ] && [ -e /proc/kcore ]; then
 	echo "Testing kernel disassembly"
 	perf record -o ${perfdata} -e cs_etm//k --kcore -- touch $file > /dev/null 2>&1
 	perf script -i ${perfdata} -s python:${script_path} -- \
@@ -50,8 +50,8 @@ if [ -e /proc/kcore ]; then
 	grep -q -e ${branch_search} ${file}
 	echo "Found kernel branches"
 else
-	# kcore is required for correct kernel decode due to runtime code patching
-	echo "No kcore, skipping kernel test"
+	# Root and kcore are required for correct kernel decode due to runtime code patching
+	echo "No root or kcore, skipping kernel test"
 fi
 
 ## Test user ##

-- 
2.34.1


