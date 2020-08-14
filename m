Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 298C0245019
	for <lists+linux-doc@lfdr.de>; Sat, 15 Aug 2020 01:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728188AbgHNXWr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 14 Aug 2020 19:22:47 -0400
Received: from sym2.noone.org ([178.63.92.236]:56468 "EHLO sym2.noone.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727885AbgHNXWr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 14 Aug 2020 19:22:47 -0400
Received: by sym2.noone.org (Postfix, from userid 1002)
        id 4BSzxd5hZLzvjdq; Sat, 15 Aug 2020 01:22:45 +0200 (CEST)
Date:   Sat, 15 Aug 2020 01:22:45 +0200
From:   Tobias Klauser <tklauser@distanz.ch>
To:     Palmer Dabbelt <palmer@dabbelt.com>
Cc:     corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH]  Documentation/features: refresh RISC-V arch support
 files
Message-ID: <20200814232245.lmwdkla7zx22vtls@distanz.ch>
References: <20200810095000.32092-1-tklauser@distanz.ch>
 <mhng-3c3382c2-de41-4ccc-aeb7-7663915b2889@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-3c3382c2-de41-4ccc-aeb7-7663915b2889@palmerdabbelt-glaptop1>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2020-08-15 at 00:38:52 +0200, Palmer Dabbelt <palmer@dabbelt.com> wrote:
[...]
> Thanks.  I've put this on fixes.  Unless there are any issues I'll be sending
> out a PR tomorrow.

Jonathan already applied the patch to the linux-doc tree [1] and
it made it into Linus' tree [2] in the meantime.

[1] https://lore.kernel.org/linux-doc/20200811103940.0a9229b9@lwn.net/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f30c3ff3f0e8305d6c1a210df6d588a13333b8f7

Thanks
