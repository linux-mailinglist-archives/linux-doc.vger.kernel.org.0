Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD8295700F
	for <lists+linux-doc@lfdr.de>; Wed, 26 Jun 2019 19:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbfFZRyN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 26 Jun 2019 13:54:13 -0400
Received: from ms.lwn.net ([45.79.88.28]:41070 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726271AbfFZRyN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 26 Jun 2019 13:54:13 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C0F7E4BF;
        Wed, 26 Jun 2019 17:54:12 +0000 (UTC)
Date:   Wed, 26 Jun 2019 11:54:11 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] scripts/sphinx-pre-install: fix out-of-tree build
Message-ID: <20190626115411.1b348dfd@lwn.net>
In-Reply-To: <1561353907-19911-1-git-send-email-rppt@linux.ibm.com>
References: <1561353907-19911-1-git-send-email-rppt@linux.ibm.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 24 Jun 2019 08:25:07 +0300
Mike Rapoport <rppt@linux.ibm.com> wrote:

> Build of htmldocs fails for out-of-tree builds:
> 
> $ make V=1 O=~/build/kernel/ htmldocs
> make -C /home/rppt/build/kernel -f /home/rppt/git/linux-docs/Makefile htmldocs
> make[1]: Entering directory '/home/rppt/build/kernel'
> make -f /home/rppt/git/linux-docs/scripts/Makefile.build obj=scripts/basic
> rm -f .tmp_quiet_recordmcount
> make -f /home/rppt/git/linux-docs/scripts/Makefile.build obj=Documentation htmldocs
> Can't open Documentation/conf.py at /home/rppt/git/linux-docs/scripts/sphinx-pre-install line 230.
> /home/rppt/git/linux-docs/Documentation/Makefile:80: recipe for target 'htmldocs' failed
> make[2]: *** [htmldocs] Error 2
> 
> The scripts/sphinx-pre-install is trying to open files in the current
> directory which is $KBUILD_OUTPUT rather than in $srctree.
> 
> Fix it.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Applied, thanks.

jon
