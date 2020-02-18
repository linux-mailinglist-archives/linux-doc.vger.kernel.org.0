Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C4B2162617
	for <lists+linux-doc@lfdr.de>; Tue, 18 Feb 2020 13:26:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgBRM0U (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 18 Feb 2020 07:26:20 -0500
Received: from mga18.intel.com ([134.134.136.126]:32339 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726422AbgBRM0U (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 18 Feb 2020 07:26:20 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Feb 2020 04:26:19 -0800
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; 
   d="scan'208";a="228718753"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Feb 2020 04:26:17 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: "staging" area for unsorted random files under Documentation/*.rst
In-Reply-To: <20200218113219.7b7cc460@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200218113219.7b7cc460@kernel.org>
Date:   Tue, 18 Feb 2020 14:26:14 +0200
Message-ID: <87v9o4ulnd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 18 Feb 2020, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> Shifting those around is not easy (I tried a few times), as some discussions
> are required in order to get them at their rightful places.
>
> So, my current proposal is to just rename them to *.rst, keeping them
> where they are, and adding them into an "staging" area at the main
> index.rst. See the enclosed patch.

The obligatory bikeshedding comment, how about adding an actual
"staging" directory under Documentation, perhaps with an index.rst of
its own?

Personally I don't really mind having .txt files around either, just
*not* at the top level Documentation directory.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
