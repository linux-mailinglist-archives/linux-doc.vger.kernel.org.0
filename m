Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3C3140D6DC
	for <lists+linux-doc@lfdr.de>; Thu, 16 Sep 2021 11:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237489AbhIPJ5o (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 16 Sep 2021 05:57:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:58060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236237AbhIPJ4s (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 16 Sep 2021 05:56:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5FF5361268;
        Thu, 16 Sep 2021 09:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631786126;
        bh=370FNSMSXWQfnkF3JDENnaDFi9kWG7p+uWg23tgWip0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q9RhRyv44dfH5ryfXcw4wVbTWy3E23w+t7IghqPk8jdqAJ0TulYC7k38YnYUY+Nll
         3oZ5iKhQa0X+/xp4TEcMA1YBCLKL+ios5Sey6TmZvigNnTQkPxVEH/VPR7DPDrI3OW
         DpBA/mkYE/8VyiLZORLeB5Atdo0+LGCwCaGm+6dMd41+UOqnPg4pfg0+5MVe2bF+Ry
         wmg7fKSdw0EfdZ7YckGuVGUpwToLYTcODdSDYraKc3pdyetOuvr4s6HyETWEDlqayo
         9zVpjX6k16MRR+YxjHBCIKqTP8d2LlHe/fj3g9pxHON+wK5PWXrNHotMbV3mfqVi+I
         OnlbTjuwmM9qQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mQo72-001vUI-Mg; Thu, 16 Sep 2021 11:55:24 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/23] MAINTAINERS: update ti,sci.yaml reference
Date:   Thu, 16 Sep 2021 11:55:14 +0200
Message-Id: <271a85356c045155fc92cbfdd4f76594dc789ced.1631785820.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631785820.git.mchehab+huawei@kernel.org>
References: <cover.1631785820.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changeset 5a9652f6994e ("dt-bindings: arm: keystone: Convert ti,sci to json schema")
renamed: Documentation/devicetree/bindings/arm/keystone/ti,sci.txt
to: Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml.

Update its cross-reference accordingly.

Fixes: 5a9652f6994e ("dt-bindings: arm: keystone: Convert ti,sci to json schema")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9cf038e2c783..3bc18cfe73a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18546,7 +18546,7 @@ M:	Santosh Shilimkar <ssantosh@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/keystone/ti,k3-sci-common.yaml
-F:	Documentation/devicetree/bindings/arm/keystone/ti,sci.txt
+F:	Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
 F:	Documentation/devicetree/bindings/clock/ti,sci-clk.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
-- 
2.31.1

