Return-Path: <linux-doc+bounces-12092-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1500C87B2DE
	for <lists+linux-doc@lfdr.de>; Wed, 13 Mar 2024 21:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEBEB1F246FD
	for <lists+linux-doc@lfdr.de>; Wed, 13 Mar 2024 20:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C963F50A75;
	Wed, 13 Mar 2024 20:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="oRLgsPtD"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1CC4F1FE
	for <linux-doc@vger.kernel.org>; Wed, 13 Mar 2024 20:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710361704; cv=none; b=hX8FUrKXYLgsG7KOJua1nKpQk4BkKcPA2C++zx1cnRSTqbhrn3U/uPMu/rA3NgKnN6s4Rrixeahh4xbrXUK2OnwhRTAq5McMyx/twDvbLEiwExL9sQpeJX6Xi+9a4DWKuQtMVQEWX6yNZVCjC3W0z86bshk4YTV2T9AwKnvPce4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710361704; c=relaxed/simple;
	bh=iMCRzKCwtOFIDF9hmdcyBiISQPSwyJVzWj1dCAmbdA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uEeOFSzPr/enbO+5JB1ZQMEQZ7F6QRyDaV+Ko4Go3pc8bK+gK525G+oTYRsfpsEEhIjbFrpLFkc1mXoZY0Tc1wYOAN6khFz8ZFGS3i8ljpdmnNQV1aRCJyIK3q/TaEeFyJjxn9w7wVueC0SkwwhXrf2+k1pswc7ScSf9wAFkUkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=oRLgsPtD; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3c19e18470aso254170b6e.1
        for <linux-doc@vger.kernel.org>; Wed, 13 Mar 2024 13:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710361702; x=1710966502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KAWRgWU6WLEXQVBoGzfJEbXOKTd+ZWBJGPDK+Tp7qSI=;
        b=oRLgsPtD1jgq5FFcuvFAyA9vruYinPqt5BIzo5MdfSVG4FqBlNzn+UBg6ucGg53hoD
         pv3uFOzuEbGxX5XjGEZpmKEfQAcwUsE3vFb86la4RwxKLu4rJPqP1NRcS9JaW80ax6CR
         1pCGb7pnf3uJdaL1UmMzF7eGFdbul8sWX0eYcNzjzB+JOTxzX27Fc1YdXZAIKonvDMSW
         2cqGUEAUvEFY82ECMRGmqWw9y5O0esewP4gf4c9OnhtbkK7CxgS1R7zKbZyCe0fM0DaN
         SIbhmV6Rgn22oxztjlRXyRNJUgrD74XHmKnG1eUyKpg2+zJJQlfEq2RNLHBeriW6Mgv0
         kqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710361702; x=1710966502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KAWRgWU6WLEXQVBoGzfJEbXOKTd+ZWBJGPDK+Tp7qSI=;
        b=vdAuaH6gWwrS/k4y1hUBKmE93qochhLmyHbnTf75cKdyT9BCjreA3eGneFyk6jmrvD
         XJwEhAG3W/57+lDJShW/B/eHDPejMFIV+8Rb1XsRpu1bTXueXG8jWYw614FOWZw3LKfR
         w+4BzlLleEnNazGp1QCqklkMzmHfUI9qP4DjOXetCmaQ3t8HlKeBSRV87T/WDOVmRxSl
         5ANpFzgZr82Q5dMwiroW0ZIjxJ5vYDajUrcDHCqYjWeDIu8dptHOSkAnHkLVuidzHRsR
         qBKFIHP6P/IToeTfM47q1YvkutsWWf4f2wEryezc9KsBQN+loSfxcyzI8EL82tVaAoE+
         ToQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe1yTCG5zMgMxxKWsmzQ1VrYxCn6pwGvdgtlfE7rLZm31/kruwLSCAUGwMZtN4NkmMoqFvEdF87gfsohHUbKVKcLfvbWAMT/bv
X-Gm-Message-State: AOJu0YzMCQzURdciAuhLmUGIHnOx0gDWPl+JaGY1OFCe2Dw/HwsV9L7c
	9L+1AvUkW8iGknABkNsvkUWNhU+AXbG0HHbiMq1BjIw5ZaokRHxjj6appnSCTBk=
X-Google-Smtp-Source: AGHT+IEOPc5OEL968XGI9Srb8DwBFMxD/2mugMqwuczh3UoC7IERpmKsonAhCJ+UnsiA3uICMUraLA==
X-Received: by 2002:a05:6808:ecd:b0:3c1:d184:98c9 with SMTP id q13-20020a0568080ecd00b003c1d18498c9mr964366oiv.13.1710361701855;
        Wed, 13 Mar 2024 13:28:21 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id s8-20020a9d58c8000000b006e4eaa4ba7esm21520oth.61.2024.03.13.13.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 13:28:21 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] docs: iio: new docs for ad7944 driver
Date: Wed, 13 Mar 2024 15:21:50 -0500
Message-ID: <20240313-mainline-ad7944-doc-v1-0-7860416726e4@baylibre.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit

Adding documentation for the recently applied ad7944 driver.

Note: this also covers the features added in [1] that hasn't been
applied yet.

[1]: https://lore.kernel.org/linux-iio/20240311-mainline-ad7944-3-wire-mode-v1-1-8e8199efa1f7@baylibre.com/

Also updating the MAINTAINERS file to catch iio documentation since this
seems to have been overlooked.

---
David Lechner (2):
      MAINTAINERS: add Documentation/iio/ to IIO subsystem
      docs: iio: new docs for ad7944 driver

 Documentation/iio/ad7944.rst | 227 +++++++++++++++++++++++++++++++++++++++++++
 Documentation/iio/index.rst  |   1 +
 MAINTAINERS                  |   2 +
 3 files changed, 230 insertions(+)
---
base-commit: bbafdb305d6b00934cc09a90ec1bb659d43e5171
change-id: 20240313-mainline-ad7944-doc-285b47ed6d35

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


