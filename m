Return-Path: <linux-doc+bounces-30679-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D1D9C7C3C
	for <lists+linux-doc@lfdr.de>; Wed, 13 Nov 2024 20:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEAE8B2ABB2
	for <lists+linux-doc@lfdr.de>; Wed, 13 Nov 2024 19:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 404E2206051;
	Wed, 13 Nov 2024 19:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gB5iGwxf"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23A82038DD
	for <linux-doc@vger.kernel.org>; Wed, 13 Nov 2024 19:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731526371; cv=none; b=GZs3PFbGsNc3X2PyhnezJMji5Xbl4PcQDqptgO+UbK/JbMmPkcdJdzrUs6iRYoA2vDezTG54tYtvt5wDng0dc4YbYSCcwmO7jQshWiETFeJKoXBThb7Z10MWpf3QIWnHuBYcovWYx264LW997bGIkv2+3N1I6S/2cv6nk3qk62I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731526371; c=relaxed/simple;
	bh=nApyAd+a70czn9T6Ix8XZDHOAgzwqJqqpfIdvBLSRcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CiRx1IC/jW8R8yAqP/HqqAcUygGgsgfs6KbbYb+Zb8CUIviVyA3pdL5pzkBRYVcDHlAy4VsuVs4+2nSEopCooNzkd5dqE3UiTI4LOu2ERUwpGL7HQsUwBANyF7pXdthZ3v6NYiItPrOxkzUL/Fi0RLP/Fyh5e0VngUCdil70vNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gB5iGwxf; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-720be27db27so6138502b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 13 Nov 2024 11:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731526369; x=1732131169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/CiSjaacpPHSY42SPF7XSjDoum1kf9R1H6AE+2PSB0=;
        b=gB5iGwxfi76N7hm93mZW0S603LzwYoNPN4w0PVwEu9euZn83zrT4jinxflAadrNW2X
         rt3p89znZxvMylrgf5vGppkviDF4QE3ngxEPacFAwmwSRbWKXvX/+i6nYFgushxNddHp
         d1k0MGWbrizZOGKO4/ETnesVBrjtRlOdJTCZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731526369; x=1732131169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/CiSjaacpPHSY42SPF7XSjDoum1kf9R1H6AE+2PSB0=;
        b=ozad2zNWiLCXvgKkJhsKs9XBAWfB5twlsccvYuDfN94HE3G5NMPTw7OuAwQvdB702c
         d9WLaeJ1tFKhWWhh9FssLiMw22lwDOakJcNldBMDqyfa7tMMAj6Sw/ZacJhK9ta4th4x
         Mjq/6zObWd5uBRgjP07XrvXXP4pkD5PZO8aNTSChqnQ5wO0Fji0EjkOrA473x1i37j9g
         BneGtW39eWOx7OZv39MihCYYEQ5JFSmQwyS0yZFIncQLjYHSEe6pzuyFp8MiYThGyu4q
         Zk3fpp49Bd6S6Ib8YsXee5xro/e8tYdbbHN/yelDV3K3/iCaGVYz7dSkXYxPosMZFhKk
         w37Q==
X-Forwarded-Encrypted: i=1; AJvYcCVGyy/zCuZBTxmk7QawDSN6zvCpEq/StWSqAJ2CLOef72hLlXorCZB9QPwySyFvJTEy20kM1VTH7DU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrrpu458C/Yk/Timructp9j+oM/gvwbfJZitkvyPsdFrFhzUm5
	5zYPuR6KQw2HXmHWvknmhUXMPNeHkp0iht/NLivFOTJc7JaAt+2YgWr+EcU09w==
X-Google-Smtp-Source: AGHT+IFxd6/xp5DIYPtMlN/hIvH+AYS3qZ6K5C62dWwHjDNdTlo5VlQTT9IU5pBwkJF1bIkSeZwEBQ==
X-Received: by 2002:a05:6a00:3a2a:b0:71e:4ee1:6d78 with SMTP id d2e1a72fcca58-7244a4fde5fmr9799343b3a.1.1731526369119;
        Wed, 13 Nov 2024 11:32:49 -0800 (PST)
Received: from li-cloudtop.c.googlers.com.com (51.193.125.34.bc.googleusercontent.com. [34.125.193.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72463e72282sm630883b3a.119.2024.11.13.11.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 11:32:48 -0800 (PST)
From: Li Li <dualli@chromium.org>
To: dualli@google.com,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	donald.hunter@gmail.com,
	gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	maco@android.com,
	joel@joelfernandes.org,
	brauner@kernel.org,
	cmllamas@google.com,
	surenb@google.com,
	arnd@arndb.de,
	masahiroy@kernel.org,
	bagasdotme@gmail.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	netdev@vger.kernel.org,
	hridya@google.com,
	smoreland@google.com
Cc: kernel-team@android.com
Subject: [PATCH net-next v8 1/2] tools: ynl-gen: allow uapi headers in sub-dirs
Date: Wed, 13 Nov 2024 11:32:38 -0800
Message-ID: <20241113193239.2113577-2-dualli@chromium.org>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
In-Reply-To: <20241113193239.2113577-1-dualli@chromium.org>
References: <20241113193239.2113577-1-dualli@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jakub Kicinski <kuba@kernel.org>

Binder places its headers under include/uapi/linux/android/
Make sure replace / with _ in the uAPI header guard, the c_upper()
is more strict and only converts - to _. This is likely a good
constraint to have, to enforce sane naming in enums etc.
But paths may include /.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Li Li <dualli@google.com>
---
 tools/net/ynl/ynl-gen-c.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/net/ynl/ynl-gen-c.py b/tools/net/ynl/ynl-gen-c.py
index c48b69071111..e548afa685fa 100755
--- a/tools/net/ynl/ynl-gen-c.py
+++ b/tools/net/ynl/ynl-gen-c.py
@@ -2416,6 +2416,7 @@ def uapi_enum_start(family, cw, obj, ckey='', enum_name='enum-name'):
 
 def render_uapi(family, cw):
     hdr_prot = f"_UAPI_LINUX_{c_upper(family.uapi_header_name)}_H"
+    hdr_prot = hdr_prot.replace('/', '_')
     cw.p('#ifndef ' + hdr_prot)
     cw.p('#define ' + hdr_prot)
     cw.nl()
-- 
2.47.0.277.g8800431eea-goog


