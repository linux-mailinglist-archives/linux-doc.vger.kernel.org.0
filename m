Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C85363266
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jul 2019 09:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbfGIHwf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 9 Jul 2019 03:52:35 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43556 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbfGIHwf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Jul 2019 03:52:35 -0400
Received: by mail-lf1-f65.google.com with SMTP id c19so7096056lfm.10;
        Tue, 09 Jul 2019 00:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DuuUrAgsz3xn2IqR+NT+Aj6rVjOzsXF/3wR7kdRlWbE=;
        b=dQ/PcvYdgxFItwCLBKfdLyjVcvNvYsUJ5Q+51qBcdq9eubZbqj8syBaBfP0KESHSLY
         Z918J4YDsa+RLt0a3HQmNjmzG61kTbpPjvgStXkuT9gmtPINmN5jXR86f5tQ0C8P+VL8
         d8sGsEIDo4VpwF/AkusGrMrKMRHPcZN4ykusdAnVdYF67aFHIMCAyqed7MZZUSUCuYkK
         gR2VECe4aClsoCqGZErRXZo8p1+ft3gTEgmf6XAg1HizFW7bffyZ0STu6ZH2MxSsC4zf
         Ahs1M5N5J2ynG3zxHo162n0Md5zrJxUYcP/40eOtIC2D/nKSNx9qlqZ27/FmSIAIUeox
         NpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DuuUrAgsz3xn2IqR+NT+Aj6rVjOzsXF/3wR7kdRlWbE=;
        b=Be/pE0rN0BzW/qdMRxhvfFgfoM98pI1jDmCC8bVdDWkDZIVMi/kGt+BIioSZ91Z4KS
         M6QW4+Qn6DS+Z15pAKRF0oBfucGRFZxWSUUFpMx571zZKITCA+RADrfpGwDkiVhArWQc
         SzPNu3r3XyJiYbsKSGwXcku3cgKxtPEz+rvQE5CXxftbxKZeU2/d1TlU6u6SktLsYnsR
         GpZZFY2nxB6MS3a/ru2pcJTuIP8/AIQnq5Q5LbuRFS8ZQCWq8nVIOs5hS+9wL0mijPaY
         7WvGuZElPO26uU43+DyAIMZP+carupr2C3HM/X5QC/nwGGLaEO3GRBHk8aypZBUca0u5
         m3Ag==
X-Gm-Message-State: APjAAAXLY83syJMiF9fN6QrpnXjIR23nrO+uaPsyY2mOLmUaaYgcMVf4
        hvDmnsNcZfjO/HgN7TyV3ds=
X-Google-Smtp-Source: APXvYqzX6Zf6etGzbp7h/9xS8RJsEHNI1ZI78gvlpwc7B8V0aOtNh951rX5ZyXmbLZFvDCLcBjXXaQ==
X-Received: by 2002:ac2:4901:: with SMTP id n1mr10968478lfi.153.1562658752587;
        Tue, 09 Jul 2019 00:52:32 -0700 (PDT)
Received: from localhost.localdomain (c-5eea3126-74736162.cust.telenor.se. [94.234.49.38])
        by smtp.gmail.com with ESMTPSA id z22sm2467055ljz.20.2019.07.09.00.52.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 00:52:31 -0700 (PDT)
From:   Marcus Folkesson <marcus.folkesson@gmail.com>
To:     William Breathitt Gray <vilhelm.gray@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-iio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v2] docs: driver-api: generic-counter: fix file path to ABI doc
Date:   Tue,  9 Jul 2019 09:54:36 +0200
Message-Id: <20190709075436.7294-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
v2: Correct the other place as well..

 Documentation/driver-api/generic-counter.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/generic-counter.rst b/Documentation/driver-api/generic-counter.rst
index 0c161b1a3be6..8382f01a53e3 100644
--- a/Documentation/driver-api/generic-counter.rst
+++ b/Documentation/driver-api/generic-counter.rst
@@ -233,7 +233,7 @@ Userspace Interface
 Several sysfs attributes are generated by the Generic Counter interface,
 and reside under the /sys/bus/counter/devices/counterX directory, where
 counterX refers to the respective counter device. Please see
-Documentation/ABI/testing/sys-bus-counter-generic-sysfs for detailed
+Documentation/ABI/testing/sysfs-bus-counter for detailed
 information on each Generic Counter interface sysfs attribute.
 
 Through these sysfs attributes, programs and scripts may interact with
@@ -325,7 +325,7 @@ sysfs attributes, where Y is the unique ID of the respective Count:
 
 For a more detailed breakdown of the available Generic Counter interface
 sysfs attributes, please refer to the
-Documentation/ABI/testing/sys-bus-counter file.
+Documentation/ABI/testing/sysfs-bus-counter file.
 
 The Signals and Counts associated with the Counter device are registered
 to the system as well by the counter_register function. The
-- 
2.22.0

