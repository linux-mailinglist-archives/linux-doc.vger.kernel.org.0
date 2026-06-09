Return-Path: <linux-doc+bounces-91634-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xVdGIaQoKGoX/QIAu9opvQ
	(envelope-from <linux-doc+bounces-91634-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 16:52:20 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D54EE6615BF
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 16:52:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=aznoaGQW;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91634-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91634-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B06D3168A32
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 14:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C644219E9;
	Tue,  9 Jun 2026 14:31:39 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B623F871C
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:31:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015499; cv=none; b=C8Ig4jiXfMZf0D9MmNNttErO/D5pB/9Yicg/j3FfqmyxrF3u2wyzxtlGXu8xT5a7kocqBHbNC/nunGFc+7BtQ6o6lsiOmbglFaa7hoXD4A6YHGC4e4VDg8aXdlM28avMHCG55rji1kPqY/Und9CJ0R99EotFnn1HuI3I32iIgmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015499; c=relaxed/simple;
	bh=JQDAylSrWLAHes5gxsm3uG5xwu2zN9a3IzjF5B5oWaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FlElniB3EjvELQGGsdUZA+AkovyHQUhThumhNLCu3XZKUQmw1fXcOZjP8P1fcSc+qUv/v6aYiz3j6Bz/Rnqca7otCbPAG+8GANzLaoHtknv79H1Ig1wDEb5NY1DQBLzHoOFBV1Q8cWe96IhJYNX8Z9G+bnXWXsfLJYeskC5CU2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aznoaGQW; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490ac357c55so61382095e9.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781015496; x=1781620296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4tCZA64ZljHdNthuUJI8G+lKrRp8mWLWbXdPVNi3pLg=;
        b=aznoaGQW4Cn8IoXnyNL9FK9/L8Wr10nMzvLXRtmkMWku79n8a3y46U0jKYydLSDwAd
         fOLHT57qFTO4OjImF/7hzDVg+UJL5hI5kgiaLeTcK2n8uzu5af0MEMDFvSAqyuz/mHAu
         QngP5okINBGTcN7Hy9zec0cAVMcRnB/4ddzHeJViq/9suQ8DSvLgM60EAaBeGkkcVKc9
         7PC5POdRRYUziJRxqxz+nMAstMCxOCrwi4wv+JXP01TBClNt66XvYMsjqHrgMLlCJoBv
         f2TtXayxu4ZhfaxMK0B1zAb8seXGVvLT4DKXWhTnn4b0eceYKeb5W8vnfhhCWVgAiZ+G
         8HGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015496; x=1781620296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4tCZA64ZljHdNthuUJI8G+lKrRp8mWLWbXdPVNi3pLg=;
        b=Qn7/1v6uFjj05e/V10bdHCxJYZJQDRvYvtGCOvzKRD0hWITn74545bK8X0XY5hNs6d
         bK+Rz7LsiRlPJtwqVE9WvQfOwxeoQesXWfCCel6+GGWkRhurMzTGxT45qfoygAmMupTf
         ACbP2USyrkZIjGTcT18PVaVV2aIq/9X58b2cSmK2zPjQ6OY0ydIZOynBg3Cy9V1B/P0w
         KCNvlk2eN07PwIAeUkevsEJj4jEgsBLBkEds1rrbYLwMqpOXmdTKTTU1MZWuhktTm18g
         7CaxC7LVijr0KXsd3tGZbieGzF9T3Mh/JBWw5kQDXSOVScJAk1GSw3ewdIN20iJQIfcT
         H/cA==
X-Forwarded-Encrypted: i=1; AFNElJ/uYtGR+/qKzuAEeHn+JB2Ayv+KLFW07vLGny8Yr2/skrB0iDHqLNk39ErUNOxF9F7ULAojQScu84c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMVNc1SEj3XqUgmeGVFYvK2/aOXuDKEOvm7O1zJ47lCnoU+Z+d
	uPh/LrpFeqt/79AO95b0JeZdGY319/O8DvrfMl8ZKZOG8iz4PXBltck/bfyPVGD8WIVB5b8dnqF
	yaZzGUws=
X-Gm-Gg: Acq92OFc2nRsKAOxYnEcMTrBg0o+ZXgWne+mg9UsIoSQhnkwSn2XSy5MdsstxXe5ub0
	poJooZQw2wIxwddJ5Zz8WVv5p5HdWm0r+llOLNvxmDtUg0WOx2cZgRoFpawoDGfiuaGuRrmNQzE
	vCl15HTFGfsXCZuGUih5JhIE4CGykhlfeT6Uukr9iqejEfopgi78bYoTwquBklTiSLBmbrXY7h+
	pTdJ928GCb7csWrpV7yFZc8JObQ5vhjG+qognE3UV7f6ubXsj50m79CnMShKY4/MhXVQ2KGKdct
	irJHG4xUqUu4ARMoyDNkO/TstRiAA9q+19XtEwtxX5EB4A4EQ0CKBagX7G9M4ZnLf81vKQCpEtE
	9WgSg9wa1itkU1WHFcGW/xQReCH6pk48/O/sFNKnQUsFZ4KsyjwylsTyhJt5aVm41tqEC2RrkP0
	Y1VDmrk9RxbFpc1abulVx5Udetvnaz82RaDtba+lyOtQY=
X-Received: by 2002:a05:600d:8444:20b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-490c6c20071mr173501595e9.3.1781015496173;
        Tue, 09 Jun 2026 07:31:36 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm62738388f8f.20.2026.06.09.07.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:31:35 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 09 Jun 2026 15:31:06 +0100
Subject: [PATCH v4 13/19] perf test cs-etm: Reduce snapshot size
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-james-cs-context-tracking-fix-v4-13-44f9fb9e5c42@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-91634-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,arm.com:email,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D54EE6615BF

The default buffer size for root is 4MB which is very slow to decode. We
only need a few KB to verify that the dd process is hit so reduce the
size to 128KB.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/test_arm_coresight.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/test_arm_coresight.sh b/tools/perf/tests/shell/test_arm_coresight.sh
index 8ed2c934c87d..da2f599393e2 100755
--- a/tools/perf/tests/shell/test_arm_coresight.sh
+++ b/tools/perf/tests/shell/test_arm_coresight.sh
@@ -156,7 +156,7 @@ arm_cs_etm_system_wide_test() {
 
 arm_cs_etm_snapshot_test() {
 	echo "Recording trace with snapshot mode"
-	perf record -o ${perfdata} -e cs_etm// -S \
+	perf record -o ${perfdata} -e cs_etm// -S -m,128K \
 		-- dd if=/dev/zero of=/dev/null > /dev/null 2>&1 &
 	PERFPID=$!
 

-- 
2.34.1


