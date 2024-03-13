Return-Path: <linux-doc+bounces-12093-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB5A87B2E1
	for <lists+linux-doc@lfdr.de>; Wed, 13 Mar 2024 21:28:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1E2CB22DBF
	for <lists+linux-doc@lfdr.de>; Wed, 13 Mar 2024 20:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B22551034;
	Wed, 13 Mar 2024 20:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="U8vz1Gii"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61884F8B2
	for <linux-doc@vger.kernel.org>; Wed, 13 Mar 2024 20:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710361705; cv=none; b=u9lnSN2+tPq6BbIctSIDd9zpOJCOrif7vUFqp1MLr980mPZ2BLFXmVqbERVlYZW6jJ5yRMF/OknVfdzNgOxKkFoW5YlITB3Ca3txpIzllhqsrh/VTvdcqiz3hVUDtkBBzkK/Q/AlLmXAddHlswSOllvx8zIkFhLs1UKaWqWTPFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710361705; c=relaxed/simple;
	bh=jYLrs9FzuD/uXocxQfXfUA+/zRjYUAxdEYngmXiXnyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m1pemrsqpe/PDFMoT5WsLYZEqnyzHW2kT3faqD4FOTFeFA1/8sG1+gCIomYiPXrPs95dh+zcBeI8fCin1MSu4ogBeI6T8BDvYF5NMjTAGHsiDscA2SxkS1ZuBcXzc5KJ6k5oBGguDA0mfbHVbfECkPh4C4DL0afgmjqslRUJevc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=U8vz1Gii; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3c19dd9ade5so234404b6e.3
        for <linux-doc@vger.kernel.org>; Wed, 13 Mar 2024 13:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710361703; x=1710966503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CLFi25Vmi0M7L3CTPnrBRviDBPZHtDLMk3xJ3WKq50=;
        b=U8vz1Gii+mpp2oQkq44YI/KakIh2DgAYDtrryuv6od6Efd/OL1+8JEmwF+zSSF2aTO
         6MR6De2Qb/r0ASsTzlvw8YniL3CHhCHrp64GPRbAceVgo71nrsiUc5h9iswy2h6m3VxZ
         S1lt23IuK5tc9QiC07GOmUfbSHcdMSyRuAtJUkkRPsi2bi6D+FSBuxo4ZrZrf2vDJL17
         9JK0baPgqsUQoBAO4K1NJBY0tJfne48NCpZFnvTP+rZjdPEvE5gPGPQJw7+zMWNZv+qz
         uArrDQS5Tm+AKAYkV8Zf3GEzFXO8bwHgK5ucwaYnJwczz8+JT5DTvri4mnmUdRAZyZGh
         A1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710361703; x=1710966503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8CLFi25Vmi0M7L3CTPnrBRviDBPZHtDLMk3xJ3WKq50=;
        b=mPrDR6WaTQ6xVnRNqZfwPHW5/zDhYVjM7e+c846egU3tUtgzC9HTnrYuxW55yP2jV8
         lLU8zwVYM0C5jmR7FvfxvZvLF3+LtVOWj0pGp3/PCI5uP8yef+W47WLnIoHbjb2EK25R
         5t7KTBvmPUj61Zx9KfMGmJqCef/K8akEO07M8tSwM0GlJU8QI1V+0Y1XYYOzBjStfPYI
         Jtjjf2nJiJtG+23/G+QLVL+1/rjFHwAN35f/BJGS5JdAdGww9+NGNT4bUifkDJbuCjMh
         bsp1VDAV+vFfaWuoNSEUwVOkwVW46jdJT6hg4LrX0K56BlFGDCKfM3sRx892g4ug8A0H
         0VuA==
X-Forwarded-Encrypted: i=1; AJvYcCVlkXUdFBQbIUr4Wo2Y7hJlIOlh3eRMW1CI9vzI6jiWBE4cTIHhBO8DschPem+gR/IU0YTSSLZI1A6cAunZROL+nurH2abqT2zG
X-Gm-Message-State: AOJu0YyP1g4qHPYNKHxxczcyjmjUUgMaBvkyzv362MPu/80Rn77supDK
	IOnl4XH3ARQOxyVm3gpqcOYcFXEdco23GeKG3ZrC6ptdtk1dALoJ1/LBptT+ow+hArn+OG+doEd
	l
X-Google-Smtp-Source: AGHT+IGDSFxjduSuPwDmDtjTbGOtbt606z3slx4WCA0+AShK30IMsbb7bUCPojEYu+ofYCX6R1NNLQ==
X-Received: by 2002:a05:6808:11c5:b0:3c1:db9c:543b with SMTP id p5-20020a05680811c500b003c1db9c543bmr1005885oiv.16.1710361702866;
        Wed, 13 Mar 2024 13:28:22 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id s8-20020a9d58c8000000b006e4eaa4ba7esm21520oth.61.2024.03.13.13.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 13:28:22 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] MAINTAINERS: add Documentation/iio/ to IIO subsystem
Date: Wed, 13 Mar 2024 15:21:51 -0500
Message-ID: <20240313-mainline-ad7944-doc-v1-1-7860416726e4@baylibre.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240313-mainline-ad7944-doc-v1-0-7860416726e4@baylibre.com>
References: <20240313-mainline-ad7944-doc-v1-0-7860416726e4@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit

Patches touching the IIO subsystem documentation should also be sent to
the IIO mailing list.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7b1a6f2d0c9c..fb2377bad376 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10466,6 +10466,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
 F:	Documentation/ABI/testing/configfs-iio*
 F:	Documentation/ABI/testing/sysfs-bus-iio*
 F:	Documentation/devicetree/bindings/iio/
+F:	Documentation/iio/
 F:	drivers/iio/
 F:	drivers/staging/iio/
 F:	include/dt-bindings/iio/

-- 
2.43.2


