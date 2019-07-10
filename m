Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE1CB6499F
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jul 2019 17:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbfGJPb2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 10 Jul 2019 11:31:28 -0400
Received: from mail-lj1-f172.google.com ([209.85.208.172]:45247 "EHLO
        mail-lj1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725832AbfGJPb2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Jul 2019 11:31:28 -0400
Received: by mail-lj1-f172.google.com with SMTP id m23so2498942lje.12
        for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2019 08:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eng.ucsd.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cnlqIAHOIyJsG/bJRu+eGEGyQni0MhPJgHYJws5ekvE=;
        b=P4G1IG/IYwANC8SLjxLV3gRnTAFTS18FS8KOahuM5ApxXTmv3wqN/r7KXN5mock+da
         j9mJYh1lEwzLYye69J5ORHiChXFRApjr9ddQncletBh1BjrChktAS3vIUI/zubB+yVJ0
         S6MDbsPFmGPWY4jXF8jpV91+BARgawQsmM3Io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cnlqIAHOIyJsG/bJRu+eGEGyQni0MhPJgHYJws5ekvE=;
        b=fzElQ6BcXAME15a7EHKx5uDaOWZ6G8FvDcxFet9XGQ51Urxj3pBap7Y49C+2WBrzEs
         b7blrx+CNXtR2z4ECUEUFJAva27rv8PYVZiXljl/y3NIa50mcnm2hyQ/DeA/FkwLuzfj
         yxM5ufSJy39mDpcjYQHcXyEBsMTcGX//6d0upHB8iJfZb15pslYPTzDtad7Iy3/x5C2U
         ZRQRxBzFRcYC7HIsdAV0X5wVLbnlVKQINuF/DJHBR8gumJJ1yu1lVA/Zcz6p4BvfsaDl
         1H395N5J16kTZO1xLqf99O3Ttas0zLgwCK6LOJqbLtXoLRxG4wNamb4G8hG+UKcDSjzW
         Zazw==
X-Gm-Message-State: APjAAAV9oQyIAI2HvNm3hgmAcLgnmO3mk45zqSqt2KkJHkBhzHTnjFtm
        H/yZy7fj12qfJbg/BnwUgFdz4Q==
X-Google-Smtp-Source: APXvYqyt6Ju0gYL7cwftRcIktqG0HWoSvmvcIrH6XFsZLQbuL6UCoiBabJoDfyM1nQGr+II0EYM9jw==
X-Received: by 2002:a2e:12c8:: with SMTP id 69mr17402305ljs.189.1562772686476;
        Wed, 10 Jul 2019 08:31:26 -0700 (PDT)
Received: from luke-XPS-13.home (159-205-76-204.adsl.inetia.pl. [159.205.76.204])
        by smtp.gmail.com with ESMTPSA id o17sm517208ljg.71.2019.07.10.08.31.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 10 Jul 2019 08:31:25 -0700 (PDT)
From:   Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>
X-Google-Original-From: Luke Nowakowski-Krijger <lnowakow@neg.ucsd.edu>
To:     linux-kernel-mentees@lists.linuxfoundation.org
Cc:     Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>,
        pbonzini@redhat.com, rkrcmar@redhat.com, corbet@lwn.net,
        kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Documentation: virtual: convert .txt to .rst
Date:   Wed, 10 Jul 2019 08:30:51 -0700
Message-Id: <20190710153054.29564-1-lnowakow@neg.ucsd.edu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>

Converted a few documents in virtual and virtual/kvm to .rst format.
Also added toctree hooks to newly added files. 
Adding hooks to the main doc tree should be in another patch series 
once there are more files in the directory.

Changes in v3:
	Documentation: kvm: Convert cpuid.txt to .rst
	+ Added extra table entries that were in updated cpuid.txt

Changes in v2:
        Documentation: kvm: Convert cpuid.txt to .rst
        + added updated Author email address
        + changed table to simpler format
        - removed function bolding from v1
        Documentation: virtual: Add toctree hooks
        - Removed vcpu-request from hooks that was added in v1

Chanes in v1:
        Documentation: kvm: Convert cpuid.txt to .rst
        + Converted doc to .rst format
        Documentation: virtual: Convert paravirt_ops.txt to .rst
        + Converted doc to .rst format
        Documentation: virtual: Add toctree hooks
        + Added index.rst file in virtual directory
        + Added index.rst file in virtual/kvm directory

Luke Nowakowski-Krijger (3):
  Documentation: virtual: Convert paravirt_ops.txt to .rst
  Documentation: kvm: Convert cpuid.txt to .rst
  Documentation: virtual: Add toctree hooks

 Documentation/virtual/index.rst               |  18 ++
 .../virtual/kvm/{cpuid.txt => cpuid.rst}      | 162 ++++++++++--------
 Documentation/virtual/kvm/index.rst           |  11 ++
 .../{paravirt_ops.txt => paravirt_ops.rst}    |  19 +-
 4 files changed, 129 insertions(+), 81 deletions(-)
 create mode 100644 Documentation/virtual/index.rst
 rename Documentation/virtual/kvm/{cpuid.txt => cpuid.rst} (13%)
 create mode 100644 Documentation/virtual/kvm/index.rst
 rename Documentation/virtual/{paravirt_ops.txt => paravirt_ops.rst} (65%)

-- 
2.20.1

