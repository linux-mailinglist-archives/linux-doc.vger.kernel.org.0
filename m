Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 196873E1DB8
	for <lists+linux-doc@lfdr.de>; Thu,  5 Aug 2021 23:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241760AbhHEVKY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 5 Aug 2021 17:10:24 -0400
Received: from mga03.intel.com ([134.134.136.65]:28323 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241748AbhHEVKY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 5 Aug 2021 17:10:24 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="214281567"
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="214281567"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 14:10:09 -0700
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="437941254"
Received: from akleen-mobl1.amr.corp.intel.com (HELO [10.212.183.241]) ([10.212.183.241])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 14:10:09 -0700
Subject: Re: [PATCH v1] driver: base: Add driver filter support
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <20210804174322.2898409-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <YQrqhYEL64CSLRTy@kroah.com>
 <f2b1d564-8174-f8e9-9fee-12e938c6d846@linux.intel.com>
 <YQuYCePPZEmVbkfc@kroah.com> <YQuZdVuaGG/Cr62y@kroah.com>
 <YQuaJ78y8j1UmBoz@kroah.com>
 <fdf8b6b6-58c3-8392-2fc6-1908a314e991@linux.intel.com>
 <YQwlHrJBw79xhTSI@kroah.com>
 <21db8884-5aa1-3971-79ef-f173a0a95bef@linux.intel.com>
 <YQwpa+LAYt7YZ5dh@kroah.com>
 <1e0967ee-c41e-fd5d-f553-e4d7ab88838c@linux.intel.com>
 <CAPcyv4h26QmPhJKjtUB-VPc4TP95rBAer78OzkgXncg77tFWVw@mail.gmail.com>
From:   Andi Kleen <ak@linux.intel.com>
Message-ID: <9b2956f5-3acf-e798-ff0f-002d2d5254db@linux.intel.com>
Date:   Thu, 5 Aug 2021 14:10:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4h26QmPhJKjtUB-VPc4TP95rBAer78OzkgXncg77tFWVw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 8/5/2021 12:01 PM, Dan Williams wrote:

>> That's why I think the builtin allow list hook is still needed. Thoughts?
> I see nothing that prevents a built-in allow list to augment the
> driver-core default. Is there a gap I'm missing?


Okay so you're suggesting to build the builtin allow list on top of the 
existing framework?

I thought Greg's suggestion was to only rely on user space only.

But if we have a way to change the authorized defaults by device (not 
just bus) from inside the kernel at early boot that could well work.

Doing it only on the bus level I suspect wouldn't work though.

-Andi


