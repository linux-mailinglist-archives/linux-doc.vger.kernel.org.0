Return-Path: <linux-doc+bounces-90536-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZoG3BRXsHmqVZAAAu9opvQ
	(envelope-from <linux-doc+bounces-90536-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 16:43:33 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BD062F648
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 16:43:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=NiDViISC;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90536-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90536-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B045325411B
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2026 14:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4EC42847F;
	Tue,  2 Jun 2026 14:27:41 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FDE425CFA
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 14:27:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780410461; cv=none; b=jK+r1ML3qxPkYkMOJrgicNc5CH5POiRamaUY01qQ9HKCq8koUzpJ5k/9rbQI/XDmx8bfUt6HvvIlJaSJHpxokJJ0gD9NIfPo8Bw+3PBJ5/S5+wcBbF1KKplnOs/gy6rU3H/Qe3xy7699uhd1U1sY5R+q21lj0Uu85jbr4Fm9UsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780410461; c=relaxed/simple;
	bh=8LSDPEyYFg9oEMScO6e3DlP1X0ZKaHJzrU3+/imMTps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o2ddIKpx8Dr0GZaMqt78nQyolT6iGnClDseN57vUclGU08r7T0fLpAXYtkzvh0k6r87oIsrtslIZBLp4RJHNm8qulwjDpDA0mhr5uqllc34dU0Ruv6yU8YQkbPI5UDTs11ZQPfZBJGyctX3WKWEj81jr8JK+vtVCiLJigTNqTlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NiDViISC; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b4e1ade7so479145e9.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 07:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780410458; x=1781015258; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3CFsmZwqnn6DMPD7vsYdcccNw39lngm7NfIBTUlMynk=;
        b=NiDViISC1seieV876LAYXrFV4TMVt7QMcKRLyV7i68SfIg14S7peg5WG3INzCzhfa7
         IJHtsM6+wjm82Lt6Tbw9t/JV2K+ohhNTpel2OiSX9KIan8dl9adqOPRAXI7qgguUNiK0
         PlD5RmVnInEjSOInaNNq3H80wJc2C7xlxCLJajdS4pmRnmGZxcX+jaV2Us3X7lk1Yv1b
         YQWk2ZutnFRAq/YIPzssz3zTM7ZezhWcPI8KfKsFQMsl7H9z4013+gXITAGtnKwUuji2
         Y4QmCg0AhQJVGjva3oJJzmrWrRPH+ai9vz+qzt9yV6VWZxhQxTjtxAXIN8awHNpKJPhN
         UHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780410458; x=1781015258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3CFsmZwqnn6DMPD7vsYdcccNw39lngm7NfIBTUlMynk=;
        b=jWp/KhBJDBpugVzJwYCyISkVju4HTm/cN/5rocIwB7fxbGkVpnNZ4tMk0lTirUwhCq
         SQuL1FGpKn6Q0GaXhBUQE+NHVytgB2Wh/sqhYr7CTJbes+seGEMfeQxiiMBrSKiU4tA0
         NQcdaNfDqbOJRMf1IEyV/9EvTJ8Y31lpOp5/c7FzIB/nfCcD+1t0T54L+wYVxqC+LJSR
         9JLOFfcfyRuwHi6lTKw9dPWAbZ88O8T2dj0BNIs1jhF/rdwC+voVe7PumQwZiSoiQbcC
         zsD3iOx1mvj+t9fmAqKLPoVmYDzpu0sJKaPZwrr78pj/m8Y8wrBpszbBeKScukqNHquJ
         rvSg==
X-Forwarded-Encrypted: i=1; AFNElJ/Ip0nNwG6f8mYspml9T+i9eErN0KYp59Qig98NbhhB4P18ZuxRyVf2miwFkSpj+ao9nvr2DKehyOA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsspRIxVPHbqfRx3cqce6RZMMXRDeHCByUjI5cTRbonDKytyLC
	nIFUpuYzefymu0v1wI8okJKnSm/OgsBW79C3NdEAvwEve1+sXgBMkD1Bx5BSrra09io=
X-Gm-Gg: Acq92OEk8B0BQxcbgp0w2SYLk/sr/54Eeqr6FSPSu9jDr4OH4znHzIzHgKamD3EvbVF
	UHBy0Cmu/tacyatVDsBwr2YAAA7Qn1r2znke0ZRHAdI3ftN5zvb7pX6fkhjWu4dFByA3qFCLoWu
	XmbBh4i4lV+/d0lA3Aj8E6fLTOGA8DeC2piUd+iSq9D0Aptsd+PVF7G3retdB2gBLRm4dxMBgES
	57JvZlSl2eJDsjajqfewOgazB6BsRuBf+ODUhfOA3OEt5eocWlscbB2tXGpKD/KMpaJsX0BA4L5
	tXdidsTFObIWBiz/nZ8LdJX3or1BSah4w0KeqN+NdI/0kgUeEnuUdakQs1BeHguIdWmaNl4TB5p
	9+Lqnh28LluCN8z1PpGDKRZLr+xHtMReAwMnnkh8vslqA69Gwr/N7PUNPS2tcrXWVEEh3MNX6zd
	3sJzUNto6SBTROzmo1NHk8flCl42ZtqF5xt4w4toBwxf0=
X-Received: by 2002:a05:600d:4453:10b0:490:6869:ef13 with SMTP id 5b1f17b1804b1-490a2918e9fmr208222895e9.14.1780410457984;
        Tue, 02 Jun 2026 07:27:37 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e18e1csm66771965e9.4.2026.06.02.07.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:27:37 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 02 Jun 2026 15:26:59 +0100
Subject: [PATCH v2 17/18] perf test cs-etm: Speed up disassembly test
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-james-cs-context-tracking-fix-v2-17-85b5ce6f55c6@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90536-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:from_mime,linaro.org:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61BD062F648

We can use exit snapshot to limit the amount of trace to decode here
too. Also each call to objdump is quite expensive on kcore so limit it
to 2 samples instead of 30. We only want to see if there is no data at
all.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/test_arm_coresight_disasm.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/perf/tests/shell/test_arm_coresight_disasm.sh b/tools/perf/tests/shell/test_arm_coresight_disasm.sh
index 5ee87eb7973e..2a400fd38a36 100755
--- a/tools/perf/tests/shell/test_arm_coresight_disasm.sh
+++ b/tools/perf/tests/shell/test_arm_coresight_disasm.sh
@@ -43,9 +43,9 @@ branch_search='[[:space:]](bl|b(\.(eq|ne|cs|cc|mi|pl|vs|vc|hi|ls|ge|lt|gt|le|al)
 ## Test kernel ##
 if [ -e /proc/kcore ]; then
 	echo "Testing kernel disassembly"
-	perf record -o ${perfdata} -e cs_etm//k --kcore -- touch $file > /dev/null 2>&1
+	perf record -o ${perfdata} -e cs_etm//k --kcore -Se -m,64K -- touch $file > /dev/null 2>&1
 	perf script -i ${perfdata} -s python:${script_path} -- \
-		-d --stop-sample=30 -k ${perfdata}/kcore_dir/kcore 2> /dev/null > ${file}
+		-d --stop-sample=2 -k ${perfdata}/kcore_dir/kcore 2> /dev/null > ${file}
 	grep -q -E ${branch_search} ${file}
 	echo "Found kernel branches"
 else
@@ -55,9 +55,9 @@ fi
 
 ## Test user ##
 echo "Testing userspace disassembly"
-perf record -o ${perfdata} -e cs_etm//u -- touch $file > /dev/null 2>&1
+perf record -o ${perfdata} -e cs_etm//u -Se -m,64K -- touch $file > /dev/null 2>&1
 perf script -i ${perfdata} -s python:${script_path} -- \
-	-d --stop-sample=30 2> /dev/null > ${file}
+	-d --stop-sample=2 2> /dev/null > ${file}
 grep -q -E ${branch_search} ${file}
 echo "Found userspace branches"
 

-- 
2.34.1


