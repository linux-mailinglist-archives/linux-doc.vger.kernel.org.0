Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5F6480589
	for <lists+linux-doc@lfdr.de>; Tue, 28 Dec 2021 02:46:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234434AbhL1Bqe (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 27 Dec 2021 20:46:34 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:30181 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231948AbhL1Bqe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Dec 2021 20:46:34 -0500
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JNHPy2WGjz8w73;
        Tue, 28 Dec 2021 09:44:06 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 28 Dec 2021 09:46:32 +0800
Received: from huawei.com (10.175.100.227) by dggpeml500006.china.huawei.com
 (7.185.36.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 28 Dec
 2021 09:46:32 +0800
From:   Tang Yizhou <tangyizhou@huawei.com>
To:     <siyanteng@loongson.cn>, <siyanteng01@gmail.com>,
        <alexs@kernel.org>, <seakeel@gmail.com>
CC:     <linux-doc@vger.kernel.org>, <corbet@lwn.net>,
        <zhengbin13@huawei.com>, <tangyeechou@gmail.com>,
        Tang Yizhou <tangyizhou@huawei.com>
Subject: [PATCH v2 0/3] Translate opp into Chinese
Date:   Tue, 28 Dec 2021 10:14:04 +0800
Message-ID: <20211228021407.12449-1-tangyizhou@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate power/index.rst and power/opp.rst into Chinese.

v2:
1. Split a cleanup patch for index.rst.
2. Pick Alex's Reviewed-by tags.

Tang Yizhou (3):
  docs/zh_CN: Cleanup index.rst
  docs/zh_CN: Add power/index Chinese translation
  docs/zh_CN: Add opp Chinese translation

 Documentation/translations/zh_CN/index.rst    |   8 +-
 .../translations/zh_CN/power/index.rst        |  56 +++
 .../translations/zh_CN/power/opp.rst          | 341 ++++++++++++++++++
 3 files changed, 401 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/power/index.rst
 create mode 100644 Documentation/translations/zh_CN/power/opp.rst

-- 
2.17.1

