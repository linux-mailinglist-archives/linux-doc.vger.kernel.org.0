Return-Path: <linux-doc+bounces-61270-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED0EB87824
	for <lists+linux-doc@lfdr.de>; Fri, 19 Sep 2025 02:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5387F560E9F
	for <lists+linux-doc@lfdr.de>; Fri, 19 Sep 2025 00:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E5924469E;
	Fri, 19 Sep 2025 00:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gs9xeE5z"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8B71F3FEC
	for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 00:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758242226; cv=none; b=QIEOgLEvtL5TZLXOGCtINtSTve2auhjWmqeUkCMhkOUqibL8L2vwhUzwiOx33auRkVKgu6mkfQ5hriWR8Ukj8bYp/ZDehgHEPFP01vK4rSefQpLIBUYa/N0wDTjO1s2ShLud7HzUZTUmKgYZ0YHBR6QJvYlokVutemXI+V4NWgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758242226; c=relaxed/simple;
	bh=/zHl7Hocdub5nwWFq/uhyVeik+EKW0ciwzHubkGEnkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gvPnAqNiYn5pAW4Bf/ZNdKNHf0uoEI94EFvmLTnM5wzTg2tvQyxIEwSVGn/6tACGeV/+PSvVhz0efFuZ6xj75PEc38OO+9ksNM2HNB6xjxJHPDJZkbsL4M+MADBAf0YUwyIQthhW8nGrtH/hnN9MCGj38W2sV/nfGiX+bzxT+H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gs9xeE5z; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2445805aa2eso15624225ad.1
        for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 17:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758242224; x=1758847024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xNKV2H1bYIOdZ9kzp0zgPBPORIzeOGUyz2fBTqyLjPw=;
        b=gs9xeE5zIAvPuHixu9CkhcPmKme81+umC4AdGwD0VFrXicHioYAozaol0pFcSEZ9GJ
         7ZJIII8xxmxw1UT7Q9JetFaA+FdqKWEPnSkwsxFkXfBdid1kFoaW09NP4XBRLrkH2v9R
         rm0JB/TcD19ZfjglRqmqGhflOwLR74ylAPLm5ya76ri1b0m1OBFHU4NxCCa6bCLynGoK
         HhJemlqxN0P6oT+PwsH6gFYnQepctRDtIc3NHdMmH8SY7CSpRY/PMGtMKSTPvqcNWiMp
         a8yDUEgJBHny8IAU3IlsgfbpLVP0kEls8kuBXiZDj0daQyre50rWyNmve4FksFoVubjQ
         giFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758242224; x=1758847024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNKV2H1bYIOdZ9kzp0zgPBPORIzeOGUyz2fBTqyLjPw=;
        b=TBwmlZS1gQ+WpL74N5htBm+OBEAL36Q3UKWiwdOLjH+N3cXeYNOBdPqI81H0bbEQ2H
         xCfUEWpc2WD/WLKEqMbL5cxloCVZ2XONBO6lssxa3N/tmcj87ra6O02s6ZumxL9ODOiz
         HFijqmKCU096e6M9J+W9nnGd+u2pIUkCgTB6rhKz40pVPKUUlwIjNVKHCpNJizPsHJp4
         GcSuyQr/K8o3n4zbtnKJDlkQBcfUvn3inJfIxHcUOJ6xy2nUVTklG930OvMOktinLuyi
         jIxRToPQu6PzH0JmJ6uMxQhto0JImRCw/q3loZ50rXC+j3dW+DBsP9RXeChAXliZHm3v
         MPEw==
X-Forwarded-Encrypted: i=1; AJvYcCWckMPetHlCDbnGmiNwkSlYXNmxsoDXnJzc1Do3ymcUyDUbahQJK0GpQhTkUHpksBvmFS4UEqaGtfo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9bAtdcsh5JN09iIDP7RXrWK+D9NIAMxV/2mKm1fV/NjH7gOiV
	VepEnbbuwkpl33yzzWJBVk4ihc5dj+5Zh6NEMTQcvaHn1dPiLi3mkH/l
X-Gm-Gg: ASbGncvxQMZMucEafqUsNmJz4M+78t3AvFRotjWlCATliPelU315hfxi7eMrpnncFc4
	NplrwjfSluxFaU1FAcpkirydob0N+QAdaE5Ev3lftd/LKJD7xp/aG0jM6ZuV6TZVhcE96y8Al5h
	sK/XrIAA/HIKGRjB7CjXHLoZv7lOZIyNLEuCr8V6qxTSX1RYS4bhHSEDj0QtZ8hOMwnbPeAm2FQ
	MlVAGrgGoWzWoHG9NS+aQ6Xhd9OMmCngoXgyRP+WIOH56vPLgud+25aPr2JptJZFIg1oDBnSAZY
	8/T7+TdYR0PuDLkkgbOoOZyo8duxheNradtC1m8QQ1auNOZ41uf6D2b3Er0mnD7UvJu9LBgs0hs
	xzn/jHsDGsrdrD64y/g6ppzd8ZtDYQUal4bv5v2XO
X-Google-Smtp-Source: AGHT+IE/yBNlcgm9BPTKttWbmAHCiZjMO8WtHGa5VVD5WcCQjQ2ZZ0IocaszrdjGPXBK2fPfpIuodQ==
X-Received: by 2002:a17:902:d2d2:b0:25c:e4ab:c424 with SMTP id d9443c01a7336-269ba534e05mr24162985ad.33.1758242224003;
        Thu, 18 Sep 2025 17:37:04 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698033ff66sm36649275ad.133.2025.09.18.17.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 17:37:02 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id EA12F420B4E0; Fri, 19 Sep 2025 07:36:59 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Framebuffer <linux-fbdev@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Helge Deller <deller@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Bernie Thompson <bernie@plugable.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arvind Sankar <nivedita@alum.mit.edu>
Subject: [PATCH 0/3] framebuffer docs toctree index refactoring
Date: Fri, 19 Sep 2025 07:36:37 +0700
Message-ID: <20250919003640.14867-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=bagasdotme@gmail.com; h=from:subject; bh=/zHl7Hocdub5nwWFq/uhyVeik+EKW0ciwzHubkGEnkM=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBlnllSdYxS+K3jwt99iXc3oxld1K1Pf7Ez88NJ9dk+K9 //qzx07OkpZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjCRF4UM/+O/ua3WsUgKtWGW +994d06Y6xeL9kMOz44+b5u9a/7XZG5Ghs2hFX9eNwdKVG6//E5p/97fpw++fPU3LW+bZDbXeiF mWWYA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Hi,

Here is simple toctree refactoring for framebuffer documentation,
based on docs-next tree. Simple because it only splits the toctree
in patch [3/3] into two sections.

Enjoy!

Bagas Sanjaya (3):
  Documentation: fb: ep93xx: Demote section headings
  Documentation: fb: Retitle driver docs
  Documentation: fb: Split toctree

 Documentation/fb/aty128fb.rst  |  8 ++--
 Documentation/fb/efifb.rst     |  6 +--
 Documentation/fb/ep93xx-fb.rst |  4 --
 Documentation/fb/gxfb.rst      |  8 ++--
 Documentation/fb/index.rst     | 80 +++++++++++++++++++---------------
 Documentation/fb/lxfb.rst      |  9 ++--
 Documentation/fb/matroxfb.rst  |  9 ++--
 Documentation/fb/pvr2fb.rst    |  6 +--
 Documentation/fb/sa1100fb.rst  |  9 ++--
 Documentation/fb/sisfb.rst     |  6 +--
 Documentation/fb/sm712fb.rst   |  6 +--
 Documentation/fb/tgafb.rst     |  6 +--
 Documentation/fb/udlfb.rst     |  6 +--
 Documentation/fb/vesafb.rst    |  6 +--
 14 files changed, 81 insertions(+), 88 deletions(-)


base-commit: 348011753d99b146c190aae262ee361d03cb0c5e
-- 
An old man doll... just what I always wanted! - Clara


