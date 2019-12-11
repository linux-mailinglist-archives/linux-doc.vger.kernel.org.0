Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E49C11BA60
	for <lists+linux-doc@lfdr.de>; Wed, 11 Dec 2019 18:33:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729705AbfLKRd3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 11 Dec 2019 12:33:29 -0500
Received: from mga04.intel.com ([192.55.52.120]:57826 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729609AbfLKRd3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 11 Dec 2019 12:33:29 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Dec 2019 09:33:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,302,1571727600"; 
   d="scan'208";a="210837617"
Received: from cmclough-mobl.ger.corp.intel.com (HELO localhost) ([10.251.85.152])
  by fmsmga008.fm.intel.com with ESMTP; 11 Dec 2019 09:33:23 -0800
Date:   Wed, 11 Dec 2019 19:33:22 +0200
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     James Bottomley <jejb@linux.ibm.com>
Cc:     "Zhao, Shirley" <shirley.zhao@intel.com>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
        "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        'Mauro Carvalho Chehab' <mchehab+samsung@kernel.org>,
        "Zhu, Bing" <bing.zhu@intel.com>,
        "Chen, Luhai" <luhai.chen@intel.com>
Subject: Re: One question about trusted key of keyring in Linux kernel.
Message-ID: <20191211173322.GD4516@linux.intel.com>
References: <1575260220.4080.17.camel@linux.ibm.com>
 <A888B25CD99C1141B7C254171A953E8E4909D360@shsmsx102.ccr.corp.intel.com>
 <1575267453.4080.26.camel@linux.ibm.com>
 <A888B25CD99C1141B7C254171A953E8E4909E381@shsmsx102.ccr.corp.intel.com>
 <1575269075.4080.31.camel@linux.ibm.com>
 <A888B25CD99C1141B7C254171A953E8E4909E399@shsmsx102.ccr.corp.intel.com>
 <1575312932.24227.13.camel@linux.ibm.com>
 <20191209194715.GD19243@linux.intel.com>
 <1575923513.31378.22.camel@linux.ibm.com>
 <20191211172345.GB4516@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211172345.GB4516@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 11, 2019 at 07:23:59PM +0200, Jarkko Sakkinen wrote:
> On Mon, Dec 09, 2019 at 12:31:53PM -0800, James Bottomley wrote:
> > On Mon, 2019-12-09 at 21:47 +0200, Jarkko Sakkinen wrote:
> > > On Mon, Dec 02, 2019 at 10:55:32AM -0800, James Bottomley wrote:
> > > > blob but it looks like we need to fix the API.  I suppose the good
> > > > news is given this failure that we have the opportunity to rewrite
> > > > the API since no-one else can have used it for anything because of
> > > > this.  The
> > > 
> > > I did successfully run this test when I wrote it 5 years ago:
> > > 
> > > https://github.com/jsakkine-intel/tpm2-scripts/blob/master/keyctl-smo
> > > ke.sh
> > > 
> > > Given that there is API a way must be found that backwards
> > > compatibility
> > > is not broken. New format is fine but it must co-exist.
> > 
> > The old API is unsupportable in the combination of policy + auth as I
> > already explained.  The kernel doesn't have access to the nonces to
> > generate the HMAC because the session was created by the user and the
> > API has no way to pass them in (plus passing them in would be a huge
> > security failure if we tried).  Given that Shirley appears to be the
> > first person ever to try this, I don't think the old API has grown any
> > policy users so its safe to remove it.  If we get a complaint, we can
> > discuss adding it back.
> 
> It works within limits so it can be definitely be maintained for
> backwards compatibility.
> 
> Also, you are making a claim of the users that we cannot verify.
> 
> Finally, the new feature neither handles sessions. You claim that
> it could be added later. I have to deny that because until session
> handling is there we have no ways to be sure about that.
> 
> I see your point but this needs more consideration. It does not
> make sense to rush.

Also can test the current patch set as soon as I've done with
release critical tpm_tis bug even if I don't agree on every
point.

/Jarkko
