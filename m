Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2EA378240
	for <lists+linux-doc@lfdr.de>; Mon, 10 May 2021 12:32:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231679AbhEJKd1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 10 May 2021 06:33:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:40094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231667AbhEJKb0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 10 May 2021 06:31:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E646361927;
        Mon, 10 May 2021 10:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620642444;
        bh=ibnYU52/Ok3HMAEpJWtkYUwqaS8GzBoBFKt6UMTtInY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Z7fs/2XSnGLW7IOnW6P9hfgnuq6pHygvvEeSjzOy0c4SFFTf/Is4t64ZRCvRXpFdy
         UJEESNTv2NgmU9l+5ZUwL/6PxcaGGBSq8dMwEdeMtXhyaf+7oNKnefey4mnuv0CcSr
         pAIsjlKRfm7SbNGHd8TKYOK2W1LPzQzABnUZvsCyoXEx0dLBtYYn7/YvF0D0ee0M/e
         0+ZKPLlx1nGBv8UVvhgb7MfeOYFizinTji941wcoSROiXkJM+gY9ftHMbEh6u/5E+N
         I+417dDghb3btMHUic4ZftSL8gm0MELXV+SIKnTQ40Ts6Igl0ehAsjjGaRQirkp8pd
         HlA8oXMCMlbEQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lg38C-000UPA-Uk; Mon, 10 May 2021 12:27:20 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
        linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 13/53] docs: driver-api: fpga: avoid using UTF-8 chars
Date:   Mon, 10 May 2021 12:26:25 +0200
Message-Id: <10fced4bcc033f4683fae41db0c494c1d3503ccb.1620641727.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620641727.git.mchehab+huawei@kernel.org>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

While UTF-8 characters can be used at the Linux documentation,
the best is to use them only when ASCII doesn't offer a good replacement.
So, replace the occurences of the following UTF-8 characters:

	- U+2014 ('—'): EM DASH

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/fpga/fpga-bridge.rst | 10 +++++-----
 Documentation/driver-api/fpga/fpga-mgr.rst    | 12 +++++------
 .../driver-api/fpga/fpga-programming.rst      |  8 ++++----
 Documentation/driver-api/fpga/fpga-region.rst | 20 +++++++++----------
 4 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/Documentation/driver-api/fpga/fpga-bridge.rst b/Documentation/driver-api/fpga/fpga-bridge.rst
index 198aadafd3e7..8d650b4e2ce6 100644
--- a/Documentation/driver-api/fpga/fpga-bridge.rst
+++ b/Documentation/driver-api/fpga/fpga-bridge.rst
@@ -4,11 +4,11 @@ FPGA Bridge
 API to implement a new FPGA bridge
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-* struct fpga_bridge — The FPGA Bridge structure
-* struct fpga_bridge_ops — Low level Bridge driver ops
-* devm_fpga_bridge_create() — Allocate and init a bridge struct
-* fpga_bridge_register() — Register a bridge
-* fpga_bridge_unregister() — Unregister a bridge
+* struct fpga_bridge - The FPGA Bridge structure
+* struct fpga_bridge_ops - Low level Bridge driver ops
+* devm_fpga_bridge_create() - Allocate and init a bridge struct
+* fpga_bridge_register() - Register a bridge
+* fpga_bridge_unregister() - Unregister a bridge
 
 .. kernel-doc:: include/linux/fpga/fpga-bridge.h
    :functions: fpga_bridge
diff --git a/Documentation/driver-api/fpga/fpga-mgr.rst b/Documentation/driver-api/fpga/fpga-mgr.rst
index 917ee22db429..4d926b452cb3 100644
--- a/Documentation/driver-api/fpga/fpga-mgr.rst
+++ b/Documentation/driver-api/fpga/fpga-mgr.rst
@@ -101,12 +101,12 @@ in state.
 API for implementing a new FPGA Manager driver
 ----------------------------------------------
 
-* ``fpga_mgr_states`` —  Values for :c:expr:`fpga_manager->state`.
-* struct fpga_manager —  the FPGA manager struct
-* struct fpga_manager_ops —  Low level FPGA manager driver ops
-* devm_fpga_mgr_create() —  Allocate and init a manager struct
-* fpga_mgr_register() —  Register an FPGA manager
-* fpga_mgr_unregister() —  Unregister an FPGA manager
+* ``fpga_mgr_states`` -  Values for :c:expr:`fpga_manager->state`.
+* struct fpga_manager -  the FPGA manager struct
+* struct fpga_manager_ops -  Low level FPGA manager driver ops
+* devm_fpga_mgr_create() -  Allocate and init a manager struct
+* fpga_mgr_register() -  Register an FPGA manager
+* fpga_mgr_unregister() -  Unregister an FPGA manager
 
 .. kernel-doc:: include/linux/fpga/fpga-mgr.h
    :functions: fpga_mgr_states
diff --git a/Documentation/driver-api/fpga/fpga-programming.rst b/Documentation/driver-api/fpga/fpga-programming.rst
index 002392dab04f..fb4da4240e96 100644
--- a/Documentation/driver-api/fpga/fpga-programming.rst
+++ b/Documentation/driver-api/fpga/fpga-programming.rst
@@ -84,10 +84,10 @@ will generate that list.  Here's some sample code of what to do next::
 API for programming an FPGA
 ---------------------------
 
-* fpga_region_program_fpga() —  Program an FPGA
-* fpga_image_info() —  Specifies what FPGA image to program
-* fpga_image_info_alloc() —  Allocate an FPGA image info struct
-* fpga_image_info_free() —  Free an FPGA image info struct
+* fpga_region_program_fpga() -  Program an FPGA
+* fpga_image_info() -  Specifies what FPGA image to program
+* fpga_image_info_alloc() -  Allocate an FPGA image info struct
+* fpga_image_info_free() -  Free an FPGA image info struct
 
 .. kernel-doc:: drivers/fpga/fpga-region.c
    :functions: fpga_region_program_fpga
diff --git a/Documentation/driver-api/fpga/fpga-region.rst b/Documentation/driver-api/fpga/fpga-region.rst
index 363a8171ab0a..2636a27c11b2 100644
--- a/Documentation/driver-api/fpga/fpga-region.rst
+++ b/Documentation/driver-api/fpga/fpga-region.rst
@@ -45,19 +45,19 @@ An example of usage can be seen in the probe function of [#f2]_.
 API to add a new FPGA region
 ----------------------------
 
-* struct fpga_region — The FPGA region struct
-* devm_fpga_region_create() — Allocate and init a region struct
-* fpga_region_register() —  Register an FPGA region
-* fpga_region_unregister() —  Unregister an FPGA region
+* struct fpga_region - The FPGA region struct
+* devm_fpga_region_create() - Allocate and init a region struct
+* fpga_region_register() -  Register an FPGA region
+* fpga_region_unregister() -  Unregister an FPGA region
 
 The FPGA region's probe function will need to get a reference to the FPGA
 Manager it will be using to do the programming.  This usually would happen
 during the region's probe function.
 
-* fpga_mgr_get() — Get a reference to an FPGA manager, raise ref count
-* of_fpga_mgr_get() —  Get a reference to an FPGA manager, raise ref count,
+* fpga_mgr_get() - Get a reference to an FPGA manager, raise ref count
+* of_fpga_mgr_get() -  Get a reference to an FPGA manager, raise ref count,
   given a device node.
-* fpga_mgr_put() — Put an FPGA manager
+* fpga_mgr_put() - Put an FPGA manager
 
 The FPGA region will need to specify which bridges to control while programming
 the FPGA.  The region driver can build a list of bridges during probe time
@@ -66,11 +66,11 @@ the list of bridges to program just before programming
 (:c:expr:`fpga_region->get_bridges`).  The FPGA bridge framework supplies the
 following APIs to handle building or tearing down that list.
 
-* fpga_bridge_get_to_list() — Get a ref of an FPGA bridge, add it to a
+* fpga_bridge_get_to_list() - Get a ref of an FPGA bridge, add it to a
   list
-* of_fpga_bridge_get_to_list() — Get a ref of an FPGA bridge, add it to a
+* of_fpga_bridge_get_to_list() - Get a ref of an FPGA bridge, add it to a
   list, given a device node
-* fpga_bridges_put() — Given a list of bridges, put them
+* fpga_bridges_put() - Given a list of bridges, put them
 
 .. kernel-doc:: include/linux/fpga/fpga-region.h
    :functions: fpga_region
-- 
2.30.2

