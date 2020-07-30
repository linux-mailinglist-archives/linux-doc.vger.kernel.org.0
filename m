Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1050E233071
	for <lists+linux-doc@lfdr.de>; Thu, 30 Jul 2020 12:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbgG3KgL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 30 Jul 2020 06:36:11 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:12556 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725892AbgG3KgK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Jul 2020 06:36:10 -0400
X-IronPort-AV: E=Sophos;i="5.75,414,1589234400"; 
   d="scan'208";a="461892474"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Jul 2020 12:35:38 +0200
Date:   Thu, 30 Jul 2020 12:35:38 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     sukadev@linux.ibm.com, corbet@lwn.net,
        linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org
Subject: Documentation/powerpc: Ultravisor API
Message-ID: <alpine.DEB.2.22.394.2007301231140.2548@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The file Documentation/powerpc/ultravisor.rst contains:

    Only valid value(s) in ``flags`` are:

        * H_PAGE_IN_SHARED which indicates that the page is to be shared
	  with the Ultravisor.

        * H_PAGE_IN_NONSHARED indicates that the UV is not anymore
          interested in the page. Applicable if the page is a shared page.

The flag H_PAGE_IN_SHARED exists in the Linux kernel
(arch/powerpc/include/asm/hvcall.h), but the flag H_PAGE_IN_NONSHARED does
not.  Should the documentation be changed in some way?

julia
