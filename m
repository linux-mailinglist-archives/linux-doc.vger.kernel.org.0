Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 519D44426BD
	for <lists+linux-doc@lfdr.de>; Tue,  2 Nov 2021 06:28:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbhKBFaq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 2 Nov 2021 01:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbhKBFaq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Nov 2021 01:30:46 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 014AAC061766
        for <linux-doc@vger.kernel.org>; Mon,  1 Nov 2021 22:28:11 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id u17so5085855plg.9
        for <linux-doc@vger.kernel.org>; Mon, 01 Nov 2021 22:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=date:message-id:from:to:cc:subject:content-transfer-encoding
         :mime-version;
        bh=QlpUYZWJN3/9X1Sv9NBkaK62CkOEjlr+CDsqVlIgJIQ=;
        b=VcRT5oMz40A1iuJxETkuWzR1Vl5jIU1zwV/Vro2E9brtgZli9NpwLSQKlH2s4IE6oH
         g7pmk0/qRVgI5jdFOD8YJRh/sQH3LafWUwnmSXUruakT2vOdlynLgjAkzTGCklI5Sj9d
         5iO2/BUISEvk50LuONeKmuUoiItmIswzmo81uOikqbYiih9FNMdXCw/aUee/A0NG55UU
         G/gZNRjX7wmqsGmyFlul5tUD+ELOdwrL45jq70t5i/nWHcNWJj5dHGxM4RH1Y+m55kG4
         jBl7Zb5JDDPM5agzjC+1+5clMPwgrsgfjzdd63FFsJkxrYcNV+zkuyx5jzL8zWv13Hjy
         Ycew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:from:to:cc:subject
         :content-transfer-encoding:mime-version;
        bh=QlpUYZWJN3/9X1Sv9NBkaK62CkOEjlr+CDsqVlIgJIQ=;
        b=mivIAXENYIZxEYMtFdkLqsaHFrQnbVJx+mEYRm4Y3OPvKParGfr+UIzpSndjLNwnza
         8NwJ1DLh7iFxepzDz5eJoB4sPLyAHMdvuFH6f/NesSiwnQBdr+5nz1u1qiwO5T33IcD2
         wtsAWCEz0NvLRVRWUFx4UVkWbYNGkaeh5IPNPZhQVAnZhMfPNVF9L4X7YrN66xJZZQMS
         9kH+hRKJz2t++zVP2KXwfrtG7Ow1bZ3ZEjoUoHQ6WeQ30kb/uNQ0zM6izCTJdDvoiEgU
         Tyfp106GKstg6wDPmxLTN5dbXx9dcc8opKwYxNiaO+QhmTtQTTHFoGAmKnhx5pvBYqF0
         UjPQ==
X-Gm-Message-State: AOAM532/MNtUn2oESu2X+y73YG4tof7SCmxTjpAUTnibEVBRr+ibGH/+
        eUuH10Z5zJrYUxgP77pzoCldgA==
X-Google-Smtp-Source: ABdhPJzuDVWGP+lXj/vcnFmLXxhIH2xPyjrhlDR+8qGpshWFZDc1SCjZ0I6dIerx58XolVvFTjBCKw==
X-Received: by 2002:a17:90a:34b:: with SMTP id 11mr4146832pjf.188.1635830891243;
        Mon, 01 Nov 2021 22:28:11 -0700 (PDT)
Received: from [127.0.1.1] (117-20-69-24.751445.bne.nbn.aussiebb.net. [117.20.69.24])
        by smtp.gmail.com with UTF8SMTPSA id j6sm14293344pgq.0.2021.11.01.22.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 22:28:10 -0700 (PDT)
Date:   Tue, 02 Nov 2021 05:27:54 +0000
Message-Id: <20211102052754.817220-0-nathan@nathanrossi.com>
From:   Nathan Rossi <nathan@nathanrossi.com>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Nathan Rossi <nathan@nathanrossi.com>,
        Nathan Rossi <nathan.rossi@digi.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v4 0/3] Driver for TI INA238 I2C Power Monitor
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Nathan Rossi <nathan.rossi@digi.com>

Changes in v2:
- Added device tree binding for ti,shunt-gain to specify the target
  ADCRANGE for the ina238
- Reworked ina238 driver to use hwmon_chip_info API, and addressed
  various review comments

Changes in v3:
- Fix schema error for ti,shunt-gain binding
- Address review comments

Changes in v4:
- Change ina238_data.gain type to int

Nathan Rossi (3):
  dt-bindings: hwmon: ti,ina2xx: Document ti,ina238 compatible string
  dt-bindings: hwmon: ti,ina2xx: Add ti,shunt-gain property
  hwmon: Driver for Texas Instruments INA238

 .../devicetree/bindings/hwmon/ti,ina2xx.yaml  |  22 +
 Documentation/hwmon/ina238.rst                |  56 ++
 Documentation/hwmon/index.rst                 |   1 +
 drivers/hwmon/Kconfig                         |  12 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/ina238.c                        | 644 ++++++++++++++++++
 6 files changed, 736 insertions(+)
 create mode 100644 Documentation/hwmon/ina238.rst
 create mode 100644 drivers/hwmon/ina238.c
---
2.33.0
