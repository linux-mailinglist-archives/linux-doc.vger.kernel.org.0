Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5EEA529C
	for <lists+linux-doc@lfdr.de>; Mon,  2 Sep 2019 11:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730373AbfIBJQ6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 2 Sep 2019 05:16:58 -0400
Received: from elvis.franken.de ([193.175.24.41]:52974 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730993AbfIBJQ5 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 2 Sep 2019 05:16:57 -0400
X-Greylist: delayed 1569 seconds by postgrey-1.27 at vger.kernel.org; Mon, 02 Sep 2019 05:16:56 EDT
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1i4i2w-0008Qd-00; Mon, 02 Sep 2019 10:50:46 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id EC98FC2780; Mon,  2 Sep 2019 10:50:32 +0200 (CEST)
Date:   Mon, 2 Sep 2019 10:50:32 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jonathan Corbet <corbet@lwn.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmem: core: add nvmem_device_find
Message-ID: <20190902085032.GA7026@alpha.franken.de>
References: <20190826130829.21073-1-tbogendoerfer@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190826130829.21073-1-tbogendoerfer@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Aug 26, 2019 at 03:08:28PM +0200, Thomas Bogendoerfer wrote:
> nvmem_device_find provides a way to search for nvmem devices with
> the help of a match function simlair to bus_find_device.
> 
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> ---
>  Documentation/driver-api/nvmem.rst |  2 ++
>  drivers/nvmem/core.c               | 61 +++++++++++++++++---------------------

Any chance to get this into 5.4 ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
