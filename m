Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80670DCC57
	for <lists+linux-doc@lfdr.de>; Fri, 18 Oct 2019 19:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405417AbfJRRLN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 18 Oct 2019 13:11:13 -0400
Received: from [217.140.110.172] ([217.140.110.172]:46422 "EHLO foss.arm.com"
        rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
        id S2388005AbfJRRLN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 18 Oct 2019 13:11:13 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23BE2101E;
        Fri, 18 Oct 2019 10:10:48 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C3A53F718;
        Fri, 18 Oct 2019 10:10:46 -0700 (PDT)
Date:   Fri, 18 Oct 2019 18:10:40 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     Steven Price <steven.price@arm.com>
Cc:     Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Pouloze <suzuki.poulose@arm.com>,
        kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 01/10] KVM: arm64: Document PV-time interface
Message-ID: <20191018171039.GA18838@lakrids.cambridge.arm.com>
References: <20191011125930.40834-1-steven.price@arm.com>
 <20191011125930.40834-2-steven.price@arm.com>
 <20191015175651.GF24604@lakrids.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191015175651.GF24604@lakrids.cambridge.arm.com>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 15, 2019 at 06:56:51PM +0100, Mark Rutland wrote:
> Hi Steven,
> 
> On Fri, Oct 11, 2019 at 01:59:21PM +0100, Steven Price wrote:
> > Introduce a paravirtualization interface for KVM/arm64 based on the
> > "Arm Paravirtualized Time for Arm-Base Systems" specification DEN 0057A.
> 
> I notice that as published, this is a BETA Draft, with the explicit
> note:
> 
> | This document is for review purposes only and should not be used
> | for any implementation as changes are likely.
> 
> ... what's the plan for getting a finalised version published?

Hmmm. Not sure how I manged to find the old version of the spec given
your cover letter links to the finalised version.

Sorry for the noise!
 
> > This only adds the details about "Stolen Time" as the details of "Live
> > Physical Time" have not been fully agreed.
> 
> ... and what do we expect to happen on this front?

... and I see this has been removed from the spec for now.

[...]

> > +PV_TIME_ST
> > +    ============= ========    ==========
> > +    Function ID:  (uint32)    0xC5000021
> > +    Return value: (int64)     IPA of the stolen time data structure for this
> > +                              VCPU. On failure:
> > +                              NOT_SUPPORTED (-1)
> > +    ============= ========    ==========
> > +
> > +The IPA returned by PV_TIME_ST should be mapped by the guest as normal memory
> > +with inner and outer write back caching attributes, in the inner shareable
> > +domain. A total of 16 bytes from the IPA returned are guaranteed to be
> > +meaningfully filled by the hypervisor (see structure below).
> 
> At what granularity is this allowed to share IPA space with other
> mappings? The spec doesn't provide any guidance here, and I strongly
> suspect that it should.
> 
> To support a 64K guest, we must ensure that this doesn't share a 64K IPA
> granule with any MMIO, and it probably only makes sense for an instance
> of this structure to share that granule with another vCPU's structure.
> 
> We probably _also_ want to ensure that this doesn't share a 64K granule
> with memory the guest sees as regular system RAM. Otherwise we're liable
> to force it into having mismatched attributes for any of that RAM it
> happens to map as part of mapping the PV_TIME_ST structure.

I guess we can say that it's userspace's responsibiltiy to set this up
with sufficient alignment, but I do think we want to make a
recommendataion here.

[...]

> > +PV_TIME_ST returns the structure for the calling VCPU.
> > +
> > +Stolen Time
> > +-----------
> > +
> > +The structure pointed to by the PV_TIME_ST hypercall is as follows:
> > +
> > ++-------------+-------------+-------------+----------------------------+
> > +| Field       | Byte Length | Byte Offset | Description                |
> > ++=============+=============+=============+============================+
> > +| Revision    |      4      |      0      | Must be 0 for version 1.0  |
> > ++-------------+-------------+-------------+----------------------------+
> > +| Attributes  |      4      |      4      | Must be 0                  |
> > ++-------------+-------------+-------------+----------------------------+
> > +| Stolen time |      8      |      8      | Stolen time in unsigned    |
> > +|             |             |             | nanoseconds indicating how |
> > +|             |             |             | much time this VCPU thread |
> > +|             |             |             | was involuntarily not      |
> > +|             |             |             | running on a physical CPU. |
> > ++-------------+-------------+-------------+----------------------------+
> > +
> > +All values in the structure are stored little-endian.
> 
> Looking at the published DEN 0057A, endianness is never stated. Is this
> going to be corrected in the next release?

I'm assuming that this has been communicated internally, and we can
assume the next rev of the spec will state so.

Assuming so, this looks good to me.

Thanks,
Mark.
