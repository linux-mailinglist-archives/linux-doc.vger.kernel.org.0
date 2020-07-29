Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD46A232343
	for <lists+linux-doc@lfdr.de>; Wed, 29 Jul 2020 19:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbgG2RRB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 29 Jul 2020 13:17:01 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:17028
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726365AbgG2RRB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Jul 2020 13:17:01 -0400
X-IronPort-AV: E=Sophos;i="5.75,411,1589234400"; 
   d="scan'208";a="355580634"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Jul 2020 19:16:59 +0200
Date:   Wed, 29 Jul 2020 19:16:59 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     mchehab+huawei@kernel.org, corbet@lwn.net
cc:     linux-doc@vger.kernel.org
Subject: Documentation/scsi/aha152x.rst
Message-ID: <alpine.DEB.2.22.394.2007291908280.2459@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

The ada152 documentation mentions some compilation flags.  This was
converted to ReST as eg:

+- DAUTOCONF
+    use configuration the controller reports (AHA-152x only)

--DAUTOCONF
- use configuration the controller reports (AHA-152x only)

This is clearly not correct.  The - should be attached to the D, and not
be converted to a bullet.  I tried replacing:

- DAUTOCONF

by

- -DAUTOCONF

but the result with rst2html was not very satisfactory.  The DAUTOCONF
seems to be slightly raised with respect to the rest of the text.  And a
subsequent case:

- DSETUP0="{ IOPORT, IRQ, SCSI_ID, RECONNECT, PARITY, SYNCHRONOUS, DELAY, EXT_TRANS }"

comes out different from the ones that have no associated list of possible
values (larger letters, different font).

What should be done instead?

Also, does the kernel include some scripts for testing the documentation?
make Documentation/scsi/aha152x.html doesn't seem to work.

thanks,
julia
