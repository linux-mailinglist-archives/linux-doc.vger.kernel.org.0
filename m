Return-Path: <linux-doc+bounces-58216-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34975B3E384
	for <lists+linux-doc@lfdr.de>; Mon,  1 Sep 2025 14:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DB5B1A83A05
	for <lists+linux-doc@lfdr.de>; Mon,  1 Sep 2025 12:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CAEC337686;
	Mon,  1 Sep 2025 12:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hohsdAT8"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34C833473F
	for <linux-doc@vger.kernel.org>; Mon,  1 Sep 2025 12:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756730524; cv=none; b=cY6+blBJCBLUq7aX9DkmWpFOxC6CMTexIeTkhpsTBd3TkJMeJ85xnHJRgqm8EV/u4UCf+qhCClSy5EhXLBHjtkXjCdRNXCMvzDDTbzGNtrEB5ZFUU5XMAioDdqU6dB/qADY5cTDBL7EFs0rgokp4JKxSj8CucpolFMOUp+WxV7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756730524; c=relaxed/simple;
	bh=3yjrpHkX+aMdTK90nxuOJyMh4ajXQ8n+rTYB1GAa/ak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UtQNf9O3vbIKlnDQCqmR03qhl7ZQITLCgET1KIBSIx/cDMLwi0WxN/ZpFD75XrvMFB2HRIjKePYRzoFTrMR8TMxX/DIhp7cuRRQ1qrZkKIV/3aqYhAVwkiaQnEvjnhxWDYDC2FwZJpH9z/1M8eJBMkNX70B+OPJ9ljS8KPwaA1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hohsdAT8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45b7c01a708so13933185e9.3
        for <linux-doc@vger.kernel.org>; Mon, 01 Sep 2025 05:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756730520; x=1757335320; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45z9IaVf3DvIHNyRK9bNlm2YHb8XHVPseevdKZOW65I=;
        b=hohsdAT88bofCDMmitFNT/Kz+f8rgI/d/lT7I1OUgzfb20Z4ilH2/dj/AODXjxVX68
         k/S7JrtFSM0oYX2FBn7sGq+IKPfv8XhG6H7OCr8OXhojKf6Iv2phk+pTZ3JxPSpqakMm
         bxzV/sg0m+IqLTjFGGd3PD4QBlZykfd5fgv+uJl0QFb0Fxwe8xH5rshyPeZLVhVUWZqd
         AO/L+6LIivmq5syeDBuvcoRH3o5z0v2XEVi0OxccMPB1Jjsh/5H2b6wZrZ3kvAw0PQ51
         dfIsKo7i/pOlCLesRukCpZwBCtA11DqlKNqWNAhTvvYjpE1mWMBsiBMixi/7X8TyX6qP
         TZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756730520; x=1757335320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45z9IaVf3DvIHNyRK9bNlm2YHb8XHVPseevdKZOW65I=;
        b=qWxUnN8mDAKSAydjEeyqtccBkOMrsHgv/hVpTULZMsQnl5CgMR+WMJBsPrH5Ieq2Fw
         UGlkPgK+EL9PoSrMUS1KpFXqbN0tq6zRjqSQfwItRnbVW7yA2Ztyf2GIlVCH7BsEptTz
         PNv2S3x2yrQ1w4fKZha9os8I5zTRr2GGcxBSW95TfVKUAJbbB7TYjDpYU+0LF77Icrfr
         9+LE9KzrtVRMncQzoaBH3/Lh1BlEPZuKtmpYL0bIum1Rm16287d7JLYcmYFfd1zcKNO8
         /VIXHTrGtrXqB56KKXjT37maymVouNlwWWdipj8avu3T+CcKuwNUrp/rNQXojT+3w5ie
         oivA==
X-Forwarded-Encrypted: i=1; AJvYcCWWx7m4aVciY12OYWcX72U1+5vGqJAUBupfLalI7F7h3PboUyv5lJYKdyoKTNR1EFUbc+RuLhIJcb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMm2m38NbFy3vAnm5INwpKyN2p0QPPfWTVWPgxX3m0+zVM0xms
	zNJBkwbU3+uP5NhV+OU2Co1Wi08rg1WiffpnD1fbEmDCJ1OGgKySRZOd1nLZIQqIb00=
X-Gm-Gg: ASbGnctPh2qIuyCGsVLxEDbTeJRVdht8y1VqwUB3wXKeuHdbm4DQTInOImIIAd7KKdE
	Z66Z8r9nAAvAjqo2aHQ89H5DakhAbDKLK/MEWSuXDxknoX80jtfOpEqzRmIUjJqdC5RzmlSMEh/
	cCYRLzPJBk0U2b3W7BhGOaUjUWO0OYuzRorBgIPTs7WSw7+IF2ZeX4oCqtfbUgE3uYOJY5pIkC2
	PNAd4SfF9pkfz0T9d6JSj7A8xkc+BiOGzjKoCx7zcdbkPaTJz+OuB6pqClrT3/hKg3cUwtORhzU
	V6rBonNUG3gQDxq460BgVA1ailp54QRrjg4nzu1jUajGmvMhYSzrnupRMgqrB6VcDayF5xFyI/I
	JSmVXLgNSMG4KYRoLqmqd5dFcm3etwyvOE1IHPpxZsw==
X-Google-Smtp-Source: AGHT+IFPTd5JV8rlNw+el2iMeq4VwQ39O/JeQnoM1FnI5OWoImn9QUGVjCoJJX8IN0HGzcTQOolA/Q==
X-Received: by 2002:a05:600c:4f89:b0:45b:8d2a:cce7 with SMTP id 5b1f17b1804b1-45b8e2ee782mr21104445e9.15.1756730519938;
        Mon, 01 Sep 2025 05:41:59 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e898b99sm154946315e9.19.2025.09.01.05.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:41:59 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 01 Sep 2025 13:40:37 +0100
Subject: [PATCH v8 08/12] perf: Add perf_event_attr::config4
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-james-perf-feat_spe_eft-v8-8-2e2738f24559@linaro.org>
References: <20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org>
In-Reply-To: <20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Arm FEAT_SPE_FDS adds the ability to filter on the data source of a
packet using another 64-bits of event filtering control. As the existing
perf_event_attr::configN fields are all used up for SPE PMU, an
additional field is needed. Add a new 'config4' field.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 include/uapi/linux/perf_event.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index 78a362b80027..0d0ed85ad8cb 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -382,6 +382,7 @@ enum perf_event_read_format {
 #define PERF_ATTR_SIZE_VER6			120	/* Add: aux_sample_size */
 #define PERF_ATTR_SIZE_VER7			128	/* Add: sig_data */
 #define PERF_ATTR_SIZE_VER8			136	/* Add: config3 */
+#define PERF_ATTR_SIZE_VER9			144	/* add: config4 */
 
 /*
  * 'struct perf_event_attr' contains various attributes that define
@@ -543,6 +544,7 @@ struct perf_event_attr {
 	__u64	sig_data;
 
 	__u64	config3; /* extension of config2 */
+	__u64	config4; /* extension of config3 */
 };
 
 /*

-- 
2.34.1


