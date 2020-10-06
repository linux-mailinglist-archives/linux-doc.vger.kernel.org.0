Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEBE1284D07
	for <lists+linux-doc@lfdr.de>; Tue,  6 Oct 2020 16:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgJFOFY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 6 Oct 2020 10:05:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:33542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726483AbgJFOD4 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Oct 2020 10:03:56 -0400
Received: from mail.kernel.org (ip5f5ad5bd.dynamic.kabel-deutschland.de [95.90.213.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DEC5C2311C;
        Tue,  6 Oct 2020 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601993035;
        bh=9NOONx3pLO12LxNHsil/1PDY03fyc3flSf9nJAyamo4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IMJjPumJvC13MQd9hijC+iM5ZG7vGhjk6dzw05PDYFHc1GtTZuEgykV3eoSYrB5vD
         UlippVp8yY1GrAHCzyLOdGtXMdrgud8zjN7tKDUbAWBRx75uOREIY9lZW+CnpXYqno
         oCs4Y52eqrGLFa70qD9q+rYn84NdL5uz3KQlvokE=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kPnZJ-0019Ge-0C; Tue, 06 Oct 2020 16:03:53 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Tomas Winkler <tomas.winkler@intel.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 47/52] docs: mei.rst: fix a C expression markup
Date:   Tue,  6 Oct 2020 16:03:44 +0200
Message-Id: <330199469a2f81975a7985e51bce377cd6a23e89.1601992016.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601992016.git.mchehab+huawei@kernel.org>
References: <cover.1601992016.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sphinx 3.x doesn't allow expressions using :c:func markup:

	./Documentation/driver-api/mei/mei.rst:41: WARNING: Unparseable C cross-reference: 'close(int fd)'
	Invalid C declaration: Expected end of definition. [error at 5]
	  close(int fd)
	  -----^

So, convert it into a :c:expr.

Acked-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/mei/mei.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/mei/mei.rst b/Documentation/driver-api/mei/mei.rst
index cea0b69ec216..4f2ced4ccdc6 100644
--- a/Documentation/driver-api/mei/mei.rst
+++ b/Documentation/driver-api/mei/mei.rst
@@ -38,7 +38,7 @@ Because some of the Intel ME features can change the system
 configuration, the driver by default allows only a privileged
 user to access it.
 
-The session is terminated calling :c:func:`close(int fd)`.
+The session is terminated calling :c:expr:`close(fd)`.
 
 A code snippet for an application communicating with Intel AMTHI client:
 
-- 
2.26.2

