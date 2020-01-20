Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC4E8142CFD
	for <lists+linux-doc@lfdr.de>; Mon, 20 Jan 2020 15:16:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgATOQp (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 20 Jan 2020 09:16:45 -0500
Received: from mga02.intel.com ([134.134.136.20]:55069 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726885AbgATOQp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 20 Jan 2020 09:16:45 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Jan 2020 06:16:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,342,1574150400"; 
   d="scan'208";a="228409728"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006.jf.intel.com with ESMTP; 20 Jan 2020 06:16:42 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1itXr8-0002Xp-V7; Mon, 20 Jan 2020 16:16:42 +0200
Date:   Mon, 20 Jan 2020 16:16:42 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     lijiazi <jqqlijiazi@gmail.com>
Cc:     Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        lijiazi <lijiazi@xiaomi.com>
Subject: Re: [PATCH v3 2/3] lib/vsprintf: introduce OF_DEVICE_NODE_FLAG_MAX
Message-ID: <20200120141642.GN32742@smile.fi.intel.com>
References: <54fe6854ede6e2f22eb9775837da1ad7a13a3df4.1579423564.git.lijiazi@xiaomi.com>
 <2d432e67cab2eb51f36f5b2e904a185ef48df6e0.1579423564.git.lijiazi@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d432e67cab2eb51f36f5b2e904a185ef48df6e0.1579423564.git.lijiazi@xiaomi.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 20, 2020 at 07:38:28PM +0800, lijiazi wrote:
> introduce OF_DEVICE_NODE_FLAG_MAX for %pOF related printk.

introduce -> Introduce

> @@ -147,6 +147,13 @@ extern raw_spinlock_t devtree_lock;
>  #define OF_OVERLAY		5 /* allocated for an overlay */
>  #define OF_OVERLAY_FREE_CSET	6 /* in overlay cset being freed */

> +/*
> + * add OF_DEVICE_NODE_FLAG_MAX for %pOF related printk.
> + * if there is any change on these flags, please synchronize the change
> + * to device_node_string function in lib/vsprintf.c.

This is doubtful comment. If we don't want to print some flags in printf()?
And in general this is orthogonal to the printf() changes.

> + */
> +#define OF_DEVICE_NODE_FLAG_MAX 6 /* Maximum available flags */

-- 
With Best Regards,
Andy Shevchenko


