Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5638D140ABD
	for <lists+linux-doc@lfdr.de>; Fri, 17 Jan 2020 14:32:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbgAQNch (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 17 Jan 2020 08:32:37 -0500
Received: from mga11.intel.com ([192.55.52.93]:24421 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726587AbgAQNch (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 17 Jan 2020 08:32:37 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Jan 2020 05:32:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,330,1574150400"; 
   d="scan'208";a="398642846"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005.jf.intel.com with ESMTP; 17 Jan 2020 05:32:33 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1isRjl-0004DU-EN; Fri, 17 Jan 2020 15:32:33 +0200
Date:   Fri, 17 Jan 2020 15:32:33 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     lijiazi <jqqlijiazi@gmail.com>
Cc:     Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        lijiazi <lijiazi@xiaomi.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" 
        <devicetree@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2] lib/vsprintf: introduce OF_DEVICE_NODE_FLAG_MAX for
 %pOF
Message-ID: <20200117133233.GT32742@smile.fi.intel.com>
References: <1579259719-16904-1-git-send-email-lijiazi@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579259719-16904-1-git-send-email-lijiazi@xiaomi.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 17, 2020 at 07:15:19PM +0800, lijiazi wrote:

> Signed-off-by: lijiazi <lijiazi@xiaomi.com>

This is different from From field and there is nothing in the body about it.

-- 
With Best Regards,
Andy Shevchenko


