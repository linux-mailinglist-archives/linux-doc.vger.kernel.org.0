Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8BABA619B
	for <lists+linux-doc@lfdr.de>; Tue,  3 Sep 2019 08:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbfICGhl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 3 Sep 2019 02:37:41 -0400
Received: from verein.lst.de ([213.95.11.211]:55618 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726743AbfICGhl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 3 Sep 2019 02:37:41 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id F156F227A8A; Tue,  3 Sep 2019 08:37:36 +0200 (CEST)
Date:   Tue, 3 Sep 2019 08:37:36 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        linux-doc@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2] dma-mapping: Fix filename references
Message-ID: <20190903063736.GA17021@lst.de>
References: <20190619141956.65696-1-andriy.shevchenko@linux.intel.com> <20190813144222.GF30120@smile.fi.intel.com> <20190813144536.GA7961@lst.de> <20190902132250.GM2680@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190902132250.GM2680@smile.fi.intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 02, 2019 at 04:22:50PM +0300, Andy Shevchenko wrote:
> > > Any comment on this?
> > 
> > Fine with me, and I also agree with the glue code comment.
> 
> Are you going to apply this?

Thanks, applied to the dma-mapping tree for 5.4.
