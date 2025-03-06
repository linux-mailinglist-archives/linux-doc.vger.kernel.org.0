Return-Path: <linux-doc+bounces-40089-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BF3A547EA
	for <lists+linux-doc@lfdr.de>; Thu,  6 Mar 2025 11:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1E151708A3
	for <lists+linux-doc@lfdr.de>; Thu,  6 Mar 2025 10:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03552207DE2;
	Thu,  6 Mar 2025 10:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jb6eQ7qd"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBBF204F85
	for <linux-doc@vger.kernel.org>; Thu,  6 Mar 2025 10:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741257426; cv=none; b=knHVPyIZyHCbf/OxTi+ftwAifzmtb+qQgZNLDwAvITaYlZK8pnqfNNISHSsc8RjYgHi99Si2iyl4FGd4U33Z92kJlgulPCXQkg7Dg/MILnxmhVKC7P/eYgerQGbN9tR36qQryVE4HkcSb8M+P42UG5C8lsn5spDR5Hn65DfgpR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741257426; c=relaxed/simple;
	bh=fTXXbYfB0BUH1DTF0YolYq7hexyvidsXazu4RK0mlKM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O9xdohDNBiHn3E4Zda+x1Xf9iFneNjzFPpGLwCbHeu1A4rkvKOFxOsPTov3c/uHYMcHVdsQWi+DNX+C7Kqnk+Q/yPUFj6zjN8k2tt2gkAmX0VHu1EJXoM1rVc0WW/jnfg/B/1zzI6SSi+J5E9YWzgFZ7VXQYEakkNuRWIvhpk/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jb6eQ7qd; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ff6a98c638so791817a91.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Mar 2025 02:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741257425; x=1741862225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNjPZDPj3mGb5UUG5cx3FWB8PP4SBA0xRr+ffK+aNvI=;
        b=Jb6eQ7qdtYYt67lsClY+ejQuLYzAol/A07wk7Kid0aw/Fap9uadL5XVakMLbln2Gag
         QDwJ3WqfHOPaBhfFbyVpNb3uSQ0oGpUROvqc+JWNYrkhASqbijW+x6D6n4fFyMn6aDgU
         LcPy4JlyCbG8DPSIzL/WV9vxgmOjiYHKgeIhSgiJm91vzCa/SKRu7rRl3qpZsKW0QRdz
         555cjpY9nX44gAAYpuBw19SAeebJup8x5FJal9f3eM0s2YyNNts+B6oiDSlJ/DGCuDgG
         i8NkOtCWlu2QlPQcflCp/tHtqtxTNmULiBVeZg6Y2j0669YRpoqGleUuOemo5q2iC7S1
         bPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741257425; x=1741862225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNjPZDPj3mGb5UUG5cx3FWB8PP4SBA0xRr+ffK+aNvI=;
        b=he3rng9HRiD7EZtdYCVaasXXlA/KagJ46ygJXg2xryoyhCAuUgrA+eiEyHLsr9+vRs
         UBRqxiwaY+j9JdQ3MjjUqzaifvDF/sAChFD5SkfjmXGYVSMri1AGSAbd/w6euwFsW7GK
         Lem2DYh2BQKTaPebauO+I50u/1geyguj2SA/0l1r370hAcvMjNuaxjot4jcmNqXGvDlI
         YseCmeuHo5qdnnoN7lb+jWPHByEUNTMa0ywkinFR5lbFiPIiMqRp8Fsebp/EVy6EritS
         vFKXhu4LUf1ouFcMHNC/fdvU4QXb3+AKbU8lzNx+a3KQv1v9AsGPueKlCP40Gvna9QdV
         lqqg==
X-Forwarded-Encrypted: i=1; AJvYcCWuVRRK07ohXEU7a09J1pq/6K0T0IlstguhqgWlzumL+nJvjCsGUqBDVHcrU8Fp+520iz3KfVCOzy4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxeBIwDrvSY6X/8/Nm2zTRWnitW/bU0oQpNT+/yy8DTbpkAJ1G
	KJrQRXr5McUAh/Zxgy2CXXKn2Bng9UHczxocW7hpHPCZ1FrRR/TJ90mib9gK8kA=
X-Gm-Gg: ASbGncvg5usPqgoRCd/g4VXqdw3X47vPJH5tL1IvU0yKxSkXZfvStlPIMjagXCDdrt5
	UzLz9ilyGqfVRoHepkTCkB1wK1XDMKVx3dAb93SGhw811Y8Q/Qj2gsEIsrjjSI0bMl7EjGdfy9Y
	X83yJH1GLg26FUJoQ4Qzlas4+zfKvT2uB14dK9D5F+g4JRP6k+HISQGdCP+8pHGBrraYqX/+fPw
	zK/4wkRNiS/RIPHnN1TxKJA3E1SWTbPFmF/Zg1FkNuf88IRV7QsEcPWoqFf4ksj0RYPY4ilIfJt
	kJC0IsdlgMpJ5yFJBy8DQXtVZyGSQ6ru8O0hZHKVI9jkYQ==
X-Google-Smtp-Source: AGHT+IFuHhxzNVW3SAvDc0lqxCLDXj0WNJFxJ408MjQuPeCbrBOBGhTaE+toj4Ao+lcoYjY1bISWkA==
X-Received: by 2002:a17:90a:d644:b0:2ee:9d49:3ae6 with SMTP id 98e67ed59e1d1-2ff497a9954mr11062064a91.10.1741257424731;
        Thu, 06 Mar 2025 02:37:04 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e75edc9sm3143776a91.10.2025.03.06.02.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 02:37:04 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Yury Norov <yury.norov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] docs: core-api: Update kernel-api.rst to include cpumask.h
Date: Thu,  6 Mar 2025 16:06:51 +0530
Message-Id: <3b38b431b4307829aef6bc0c17e19d363f86657f.1741257214.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1741257214.git.viresh.kumar@linaro.org>
References: <cover.1741257214.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated Documentation/core-api/kernel-api.rst to include `cpumask.h`,
providing better reference for CPU mask operations in the kernel API.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 Documentation/core-api/kernel-api.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/core-api/kernel-api.rst b/Documentation/core-api/kernel-api.rst
index ae92a2571388..5817632381f9 100644
--- a/Documentation/core-api/kernel-api.rst
+++ b/Documentation/core-api/kernel-api.rst
@@ -90,6 +90,12 @@ Bitmap Operations
 .. kernel-doc:: include/linux/bitmap.h
    :internal:
 
+Cpumask Operations
+------------------
+
+.. kernel-doc:: include/linux/cpumask.h
+   :internal:
+
 Command-line Parsing
 --------------------
 
-- 
2.31.1.272.g89b43f80a514


