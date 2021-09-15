Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1BD40C232
	for <lists+linux-doc@lfdr.de>; Wed, 15 Sep 2021 10:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237117AbhIOI7a (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 15 Sep 2021 04:59:30 -0400
Received: from mga06.intel.com ([134.134.136.31]:4552 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237098AbhIOI72 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 15 Sep 2021 04:59:28 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="283261630"
X-IronPort-AV: E=Sophos;i="5.85,294,1624345200"; 
   d="scan'208";a="283261630"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2021 01:58:09 -0700
X-IronPort-AV: E=Sophos;i="5.85,294,1624345200"; 
   d="scan'208";a="552999867"
Received: from chenyu-desktop.sh.intel.com (HELO chenyu-desktop) ([10.239.158.176])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2021 01:58:04 -0700
Date:   Wed, 15 Sep 2021 17:03:57 +0800
From:   Chen Yu <yu.c.chen@intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <len.brown@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Aubrey Li <aubrey.li@intel.com>,
        Ashok Raj <ashok.raj@intel.com>,
        Mike Rapoport <rppt@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Alexander Graf <graf@amazon.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Hannes Reinecke <hare@suse.de>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Andra Paraschiv <andraprs@amazon.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ben Widawsky <ben.widawsky@intel.com>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/5] drivers/acpi: Introduce Platform Firmware Runtime
 Update device driver
Message-ID: <20210915090357.GA282742@chenyu-desktop>
References: <cover.1631600169.git.yu.c.chen@intel.com>
 <7a739633b30f6fb5c258f21c443ed0c17b12896f.1631600169.git.yu.c.chen@intel.com>
 <YUBZM1vnZ3LjfUKc@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUBZM1vnZ3LjfUKc@kroah.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Greg,
thank you very much for your comments,
On Tue, Sep 14, 2021 at 10:11:31AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Sep 14, 2021 at 03:58:41PM +0800, Chen Yu wrote:
> > +enum start_action {
> > +	START_STAGE,
> > +	START_ACTIVATE,
> > +	START_STAGE_ACTIVATE,
> > +};
> > +
> > +enum dsm_status {
> > +	DSM_SUCCEED,
> > +	DSM_FUNC_NOT_SUPPORT,
> > +	DSM_INVAL_INPUT,
> > +	DSM_HARDWARE_ERR,
> > +	DSM_RETRY_SUGGESTED,
> > +	DSM_UNKNOWN,
> > +	DSM_FUNC_SPEC_ERR,
> > +};
> > +
> > +struct update_cap_info {
> > +	enum dsm_status status;
> > +	int update_cap;
> > +
> > +	uuid_t code_type;
> > +	int fw_version;
> > +	int code_rt_version;
> > +
> > +	uuid_t drv_type;
> > +	int drv_rt_version;
> > +	int drv_svn;
> > +
> > +	uuid_t platform_id;
> > +	uuid_t oem_id;
> > +
> > +	char oem_info[];
> 
> Please use valid types for structures that cross the user/kernel
> boundry.
> 
Okay, I'll switch them into __u prefixed one.
> > +};
> > +
> > +struct com_buf_info {
> > +	enum dsm_status status;
> > +	enum dsm_status ext_status;
> > +	unsigned long addr_lo;
> > +	unsigned long addr_hi;
> > +	int buf_size;
> > +};
> 
> Same here.
> 
Okay, I'll fix them.
> > +
> > +struct updated_result {
> > +	enum dsm_status status;
> > +	enum dsm_status ext_status;
> > +	unsigned long low_auth_time;
> > +	unsigned long high_auth_time;
> > +	unsigned long low_exec_time;
> > +	unsigned long high_exec_time;
> 
> And same here.
> 
> And these are very odd structure names that you are adding to the
> "global" namespace.  Please make them have a prefix for your driver so
> that people know what they belong to.  "updated_result" is way too
> generic.
> 
Okay, added the driver name prefix in next version.

thanks,
Chenyu
