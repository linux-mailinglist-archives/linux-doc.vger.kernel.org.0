Return-Path: <linux-doc+bounces-83288-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLjRDZZw3WkgeQkAu9opvQ
	(envelope-from <linux-doc+bounces-83288-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Apr 2026 00:39:18 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFD83F3F66
	for <lists+linux-doc@lfdr.de>; Tue, 14 Apr 2026 00:39:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93F66303F468
	for <lists+linux-doc@lfdr.de>; Mon, 13 Apr 2026 22:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A3237D136;
	Mon, 13 Apr 2026 22:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OuRiGdCf"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFDF36605A;
	Mon, 13 Apr 2026 22:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776119682; cv=none; b=K6LysRdTVvNyIAdIuEmKaL6lbrXgG/fsGaXqYTWRvVOWkeAI99NvMsVXEYyVB6DRy2Upgtk7cyQ9fTEU4k3rl3b0ox6wvNaqH6ixExA0/f6eXiCnYV4TJpIaXkTv6t3rVih1LyMfe7QJRWtKze3lbCZWLqqmYb9udffEIEM2lQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776119682; c=relaxed/simple;
	bh=Cu8QPFAj6Omdz5GFbQTJq3dzW1ndULZyXPq+DakSqVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFUKF1AsOt2Irlb+KY/yQAswaGIWvz/QwTY7rEwaqtTDaXHHmPOlJ2+N90mKXUnHULzxWSRQcDCCf+CXtbO0FmpEuiaDwoTpqztzD0p/LScJP6Zy64ww1bKhS/QiDJBciCa3gdpzTlJzKprJ5FPDWWlvSzsSQGeLKXwEDtdQ8tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OuRiGdCf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E550C2BCAF;
	Mon, 13 Apr 2026 22:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776119681;
	bh=Cu8QPFAj6Omdz5GFbQTJq3dzW1ndULZyXPq+DakSqVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OuRiGdCfU8gDxaKCCYDmxUAp7jkhhJm36S/p/WHsvqrttBHSWlwefyol5Y5kKP7uu
	 d6HcCZ9wpbIZkzBZ6UojpbThwuvTuxHzvwRWc76izV3hUEhh8HFRoTWl42JfVsPtDz
	 2Nel5icunSsiownPDufl3GFNla3H1o8KleUTtVcpU/WVVL5BU0otXb81RzDpapgTKY
	 6n0aAPRGUgr8VcAeBWzErUwVCs1D62kGDBbnYwzTqD076497jXGQdtwaIeZYK6XFUd
	 /peXnfZWDq9ecHXb2MsFXpXOaAdu5wPJlWuP7M3e53gtCgw4Gz1HOvuxs/4XztR+4l
	 DRbiuOH7AAeNg==
Date: Mon, 13 Apr 2026 17:34:39 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jingyuan Liang <jingyliang@chromium.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, hbarnor@chromium.org,
	tfiga@chromium.org, Dmitry Antipov <dmanti@microsoft.com>,
	Jarrett Schultz <jaschultz@microsoft.com>
Subject: Re: [PATCH v3 09/11] dt-bindings: input: Document hid-over-spi DT
 schema
Message-ID: <20260413223439.GA3647847-robh@kernel.org>
References: <20260402-send-upstream-v3-0-6091c458d357@chromium.org>
 <20260402-send-upstream-v3-9-6091c458d357@chromium.org>
 <20260409-defuse-thank-4b038128fac5@spud>
 <adfdkwq_bF9dirAq@google.com>
 <20260410-sake-dollop-9f253ddb0749@spud>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-sake-dollop-9f253ddb0749@spud>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83288-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,chromium.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,suse.cz:email,devicetree.org:url,chromium.org:email]
X-Rspamd-Queue-Id: 9BFD83F3F66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 06:35:00PM +0100, Conor Dooley wrote:
> On Thu, Apr 09, 2026 at 10:16:46AM -0700, Dmitry Torokhov wrote:
> > On Thu, Apr 09, 2026 at 05:02:11PM +0100, Conor Dooley wrote:
> > > On Thu, Apr 02, 2026 at 01:59:46AM +0000, Jingyuan Liang wrote:
> > > > Documentation describes the required and optional properties for
> > > > implementing Device Tree for a Microsoft G6 Touch Digitizer that
> > > > supports HID over SPI Protocol 1.0 specification.
> > > > 
> > > > The properties are common to HID over SPI.
> > > > 
> > > > Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
> > > > Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>
> > > > Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
> > > > ---
> > > >  .../devicetree/bindings/input/hid-over-spi.yaml    | 126 +++++++++++++++++++++
> > > >  1 file changed, 126 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/input/hid-over-spi.yaml b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
> > > > new file mode 100644
> > > > index 000000000000..d1b0a2e26c32
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
> > > > @@ -0,0 +1,126 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/input/hid-over-spi.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: HID over SPI Devices
> > > > +
> > > > +maintainers:
> > > > +  - Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > > > +  - Jiri Kosina <jkosina@suse.cz>
> > > 
> > > Why them and not you, the developers of the series?
> > > 
> > > > +
> > > > +description: |+
> > > > +  HID over SPI provides support for various Human Interface Devices over the
> > > > +  SPI bus. These devices can be for example touchpads, keyboards, touch screens
> > > > +  or sensors.
> > > > +
> > > > +  The specification has been written by Microsoft and is currently available
> > > > +  here: https://www.microsoft.com/en-us/download/details.aspx?id=103325
> > > > +
> > > > +  If this binding is used, the kernel module spi-hid will handle the
> > > > +  communication with the device and the generic hid core layer will handle the
> > > > +  protocol.
> > > 
> > > This is not relevant to the binding, please remove it.
> > > 
> > > > +
> > > > +allOf:
> > > > +  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - enum:
> > > > +              - microsoft,g6-touch-digitizer
> > > > +          - const: hid-over-spi
> > > > +      - description: Just "hid-over-spi" alone is allowed, but not recommended.
> > > > +        const: hid-over-spi
> > > 
> > > Why is it allowed but not recommended? Seems to me like we should
> > > require device-specific compatibles.
> > 
> > Why would we want to change the driver code to add a new compatible each
> > time a vendor decides to create a chip that is fully hid-spi-protocol
> > compliant? Or is the plan to still allow "hid-over-spi" fallback but
> > require device-specific compatible that will be ignored unless there is
> > device-specific quirk needed?

The plan is the latter case (the 1st entry up above). The comment is 
remove the 2nd entry (with 'Just "hid-over-spi" alone is allowed, but 
not recommended.').

> This has nothing to do with the driver, just the oddity of having a
> comment saying that not having a device specific compatible was
> permitted by not recommended in a binding. Requiring device-specific
> compatibles is the norm after all and a comment like this makes draws
> more attention to the fact that this is abnormal. Regardless of what the
> driver does, device-specific compatibles should be required.
> 
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  interrupts:
> > > > +    maxItems: 1
> > > > +
> > > > +  reset-gpios:
> > > > +    maxItems: 1
> > > > +    description:
> > > > +      GPIO specifier for the digitizer's reset pin (active low). The line must
> > > > +      be flagged with GPIO_ACTIVE_LOW.
> > > > +
> > > > +  vdd-supply:
> > > > +    description:
> > > > +      Regulator for the VDD supply voltage.
> > > > +
> > > > +  input-report-header-address:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    minimum: 0
> > > > +    maximum: 0xffffff
> > > > +    description:
> > > > +      A value to be included in the Read Approval packet, listing an address of
> > > > +      the input report header to be put on the SPI bus. This address has 24
> > > > +      bits.
> > > > +
> > > > +  input-report-body-address:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    minimum: 0
> > > > +    maximum: 0xffffff
> > > > +    description:
> > > > +      A value to be included in the Read Approval packet, listing an address of
> > > > +      the input report body to be put on the SPI bus. This address has 24 bits.
> > > > +
> > > > +  output-report-address:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    minimum: 0
> > > > +    maximum: 0xffffff
> > > > +    description:
> > > > +      A value to be included in the Output Report sent by the host, listing an
> > > > +      address where the output report on the SPI bus is to be written to. This
> > > > +      address has 24 bits.
> > > > +
> > > > +  read-opcode:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint8
> > > > +    description:
> > > > +      Value to be used in Read Approval packets. 1 byte.
> > > > +
> > > > +  write-opcode:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint8
> > > > +    description:
> > > > +      Value to be used in Write Approval packets. 1 byte.
> > > 
> > > Why can none of these things be determined from the device's compatible?
> > > On the surface, they like the kinds of things that could/should be.
> > 
> > Why would we want to keep tables of these values in the kernel and again
> > have to update the driver for each new chip?
> 
> That's pretty normal though innit? It's what match data does.
> If someone wants to have properties that communicate data that
> can be determined from the compatible, they need to provide
> justification why it is being done.

IIRC, it was explained in prior versions the spec itself says these 
values vary by device. If we expect variation, then I think these 
properties are fine. But please capture the reasoning for them in this 
patch or we will just keep asking the same questions over and over. 

Rob

